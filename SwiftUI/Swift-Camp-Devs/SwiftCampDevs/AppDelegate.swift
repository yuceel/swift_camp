import UIKit
import Combine
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import OneSignalFramework
import Mixpanel

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppWindowHandler {
    
    private let oneSignalAppID = EnvironmentHelper.shared.oneSignalAppID
    private let mixPanelToken = EnvironmentHelper.shared.mixPanelToken
    
    
    
    // MARK: - Public properties -
    
    var window: UIWindow?
    var initializers: [Initializable] = [] {
        didSet { initializers.forEach { $0.initialize() } }
    }
    
    // MARK: - Lifecycle -
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        Mixpanel.initialize(token: mixPanelToken, trackAutomaticEvents: false)
        
        // Firebase setup
        
        // Firebase configure
        
        FirebaseApp.configure()
        
        // OneSignal initialization
        LoggerHelper.shared.info("Initializing OneSignal with App ID.")
        OneSignal.initialize(oneSignalAppID, withLaunchOptions: launchOptions)
        
        OneSignal.Notifications.requestPermission({ accepted in
            LoggerHelper.shared.info("User accepted notifications: \(accepted)")
            self.updateAppPermissions(notificationAllowed: accepted)
        }, fallbackToSettings: true)
        
        
        // Google Sign-In Configuration
        setupGoogleSignIn()
        
        // Local database setup
        setupAppDatabase()
        storeAppInformation()
        logDatabaseRecords()
        
        
        
        
        
        // LocalStorageHelper initialization
        LoggerHelper.shared.debug("Initializing local storage database.")
        LocalStorageHelper.shared.initializeDatabase()
        
        // Configure app database
        setupAppDatabase()
        
        // Store app information
        storeAppInformation()
        
        logDatabaseRecords()
        
        
        startObservingAppStateChanges()
        
        
        
        // MARK: - MetaFacebookEventHelper Log
        LoggerHelper.shared.info("Initializing MetaFacebookEventHelper logging.")
        
        // App Launch event
        MetaFacebookEventHelper.shared.logCustomEvent(
            eventName: "AppLaunch",
            parameters: [
                "source": "didFinishLaunching",
                "timestamp": "YYYY-MM-DD HH:MM:SS",
                "user": "USER_ID"
            ]
        )
        
        LoggerHelper.shared.info("Application did finish launching.")
        
        
        
        // Configure initializers
        initializers = StartupInitializationBuilder()
            .setAppDelegate(self)
            .build(with: launchOptions)
        
        LoggerHelper.shared.info("Application did finish launching.")
        
        // NetworkHelper initializers
        let _ = NetworkHelper.shared
        
        return true
    }
    
    
    // MARK: - Google Sign-In Configuration
    private func setupGoogleSignIn() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("CLIENT_ID not found in GoogleService-Info.plist")
        }
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
        LoggerHelper.shared.info("Google Sign-In configured successfully.")
    }
    
    
    // MARK: - Google Sign-In URL Handling
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    

        
    


    // MARK: - Observe App State Changes Using WorkManagerHelper
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



    // MARK: - App Database Setup
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
        let installDate = DateFormatter.localizedString(
            from: Date(),
            dateStyle: .medium,
            timeStyle: .short
        )

        // Fetch OneSignal Subscriber ID
        let subID = "unknown" // TODO: Replace with actual fetching logic


        let records = LocalStorageHelper.shared.fetchData(tableName: "AppInfo")

        if records.count > 1 {
            LoggerHelper.shared.warning("Multiple records found in AppInfo table. Deleting all records.")
            LocalStorageHelper.shared.deleteData(tableName: "AppInfo")
        }

        if records.isEmpty || records.count > 1 {
            LoggerHelper.shared.debug("No valid record found. Inserting a new AppInfo record.")
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
            LoggerHelper.shared.debug("Single record found. Updating the AppInfo record.")
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

        LoggerHelper.shared.info("App information stored or updated successfully.")
    }

    // MARK: - App Permissions
    private func updateAppPermissions(notificationAllowed: Bool) {
        LoggerHelper.shared.debug("Updating app permissions in local database.")


        LocalStorageHelper.shared.updateData(
            tableName: "AppInfo",
            data: ["notificationAllowed": notificationAllowed],
            condition: "id = 1"
        )

        LoggerHelper.shared.info("App permissions updated successfully.")
    }


// MARK: - Log Database Records
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



// MARK: - Global Cancellables Management
private enum AppStateManager {
    static var cancellables: Set<AnyCancellable> = []
}




}
