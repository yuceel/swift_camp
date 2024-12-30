import UIKit
import OneSignalFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppWindowHandler {

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
        OneSignal.initialize("9663e4ef-0e81-4ff2-8ae0-d37dc5225b9a", withLaunchOptions: launchOptions)
        
        OneSignal.Notifications.requestPermission({ accepted in
            print("User accepted notifications: \(accepted)")
        }, fallbackToSettings: true)
        
        // Configure initializers
        initializers = StartupInitializationBuilder()
            .setAppDelegate(self)
            .build(with: launchOptions)
        
        return true
    }
}
