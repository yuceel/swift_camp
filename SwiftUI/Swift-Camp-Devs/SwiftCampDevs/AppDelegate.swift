import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AppWindowHandler {

    private let oneSignalAppID = EnvironmentHelper.shared.oneSignalAppID
    
    // MARK: - Public properties -

    var window: UIWindow?

    var initializers: [Initializable] = [] {
        didSet { initializers.forEach { $0.initialize() } }
    }

    // MARK: Lifecycle

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {


        
        // Configure initializers
        LoggerHelper.shared.debug("Setting up app initializers.")
        initializers = StartupInitializationBuilder()
            .setAppDelegate(self)
            .build(with: launchOptions)

        LoggerHelper.shared.info("Application did finish launching.")

        return true
    }

}

