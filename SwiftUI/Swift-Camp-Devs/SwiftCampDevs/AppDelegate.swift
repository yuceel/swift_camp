import UIKit
import Combine
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import OneSignalFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppWindowHandler {

    private let oneSignalAppID = EnvironmentHelper.shared.oneSignalAppID

    var window: UIWindow?
    var initializers: [Initializable] = [] {
        didSet { initializers.forEach { $0.initialize() } }
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        LoggerHelper.shared.info("Initializing OneSignal with App ID.")
        OneSignal.initialize(oneSignalAppID, withLaunchOptions: launchOptions)

        setupGoogleSignIn()
        LocalStorageHelper.shared.initializeDatabase()
        setupAppDatabase()
        storeAppInformation()
        logDatabaseRecords()

        startObservingAppStateChanges()

        initializers = StartupInitializationBuilder()
            .setAppDelegate(self)
            .build(with: launchOptions)

        LoggerHelper.shared.info("Application did finish launching.")
        return true
    }

    private func setupGoogleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("CLIENT_ID not found in GoogleService-Info.plist")
        }
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        if Auth.auth().canHandle(url) {
            return true
        }
        return GIDSignIn.sharedInstance.handle(url)
    }

    private func logDatabaseRecords() {
        LoggerHelper.shared.debug("Fetching all records from the AppInfo table.")
        let records = LocalStorageHelper.shared.fetchData(tableName: "AppInfo")

        if records.isEmpty {
            LoggerHelper.shared.info("The AppInfo table is empty.")
        } else {
            LoggerHelper.shared.info("Fetched \(records.count) records from the AppInfo table:")
            for (index, record) in records.enumerated() {
                LoggerHelper.shared.info("Record \(index + 1): \(record)")
            }
        }
    }

    private func startObservingAppStateChanges() {
        WorkManagerHelper.shared.$currentState
            .receive(on: DispatchQueue.main)
            .sink { state in
                switch state {
                case .firstLaunch:
                    LoggerHelper.shared.info("🚀 First launch detected.")
                case .foreground:
                    LoggerHelper.shared.info("🌞 App entered foreground.")
                    MetaFacebookEventHelper.shared.logEvent(.appForeground, parameters: [:])
                case .background:
                    LoggerHelper.shared.info("🌙 App entered background.")
                    MetaFacebookEventHelper.shared.logEvent(.appBackground, parameters: [:])
                }
            }
            .store(in: &AppStateManager.cancellables)
    }

    private func setupAppDatabase() {
        LoggerHelper.shared.debug("Setting up the app database.")
        LocalStorageHelper.shared.createTable(
            tableName: "AppInfo",
            columns: [
                "id": "INTEGER PRIMARY KEY AUTOINCREMENT",
                "subID": "TEXT",
                "deviceModel": "TEXT",
                "osVersion": "TEXT",
                "installDate": "TEXT",
                "notificationAllowed": "BOOLEAN"
            ]
        )
    }

    private func storeAppInformation() {
        LoggerHelper.shared.debug("Storing app information in local database.")

        let deviceModel = UIDevice.current.model
        let osVersion = UIDevice.current.systemVersion
        let installDate = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        let subID = "unknown"

        let records = LocalStorageHelper.shared.fetchData(tableName: "AppInfo")

        if records.count > 1 {
            LoggerHelper.shared.warning("Multiple records found. Deleting all.")
            LocalStorageHelper.shared.deleteData(tableName: "AppInfo")
        }

        if records.isEmpty || records.count > 1 {
            LocalStorageHelper.shared.insertEncryptedData(
                tableName: "AppInfo",
                data: [
                    "subID": subID,
                    "deviceModel": deviceModel,
                    "osVersion": osVersion,
                    "installDate": installDate,
                    "notificationAllowed": false
                ]
            )
        } else {
            LocalStorageHelper.shared.updateData(
                tableName: "AppInfo",
                data: [
                    "subID": subID,
                    "deviceModel": deviceModel,
                    "osVersion": osVersion,
                    "installDate": installDate,
                    "notificationAllowed": false
                ],
                condition: "id = 1"
            )
        }
    }
}

private enum AppStateManager {
    static var cancellables: Set<AnyCancellable> = []
}
