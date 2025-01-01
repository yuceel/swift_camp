import UIKit
import OneSignalFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppWindowHandler {
    
    private let oneSignalAppID = EnvironmentHelper.shared.oneSignalAppID

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
        
        // OneSignal initialization
        LoggerHelper.shared.info("Initializing OneSignal with App ID.")
        OneSignal.initialize(oneSignalAppID, withLaunchOptions: launchOptions)
        
        OneSignal.Notifications.requestPermission({ accepted in
            LoggerHelper.shared.info("User accepted notifications: \(accepted)")
        }, fallbackToSettings: true)
        
        // Configure initializers
        LoggerHelper.shared.debug("Setting up app initializers.")
        initializers = StartupInitializationBuilder()
            .setAppDelegate(self)
            .build(with: launchOptions)
        
        LoggerHelper.shared.info("Application did finish launching.")
        return true
    }
}
