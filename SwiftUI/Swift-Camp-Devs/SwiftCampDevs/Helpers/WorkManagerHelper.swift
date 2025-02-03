import Foundation
import Combine
import UIKit

enum AppState {
    case firstLaunch
    case foreground
    case background
}

class WorkManagerHelper: ObservableObject {
    
    static let shared = WorkManagerHelper()
    private let logger = LoggerHelper.shared
    
    @Published var currentState: AppState = .firstLaunch
    
    // Duration and transition details
    @Published private(set) var totalForegroundDurationFormatted: String = "0h 0m 0s"
    @Published private(set) var totalBackgroundDurationFormatted: String = "0h 0m 0s"
    @Published private(set) var lastBackgroundDurationFormatted: String = "0s"
    @Published private(set) var backgroundTransitionsCount: Int = 0  // Keeps increasing with every transition
    @Published private(set) var totalTimeSinceLaunchFormatted: String = "0h 0m 0s"
    
    private var backgroundStartTime: Date?
    private var foregroundStartTime: Date?
    private var appLaunchStartTime: Date?
    
    private var totalForegroundDuration: TimeInterval = 0
    private var totalBackgroundDuration: TimeInterval = 0
    
    private var isFirstLaunch = true
    
    // MARK: - Initialization
    private init() {
        startListening()
        handleFirstLaunch()
    }
    
    // MARK: - App Lifecycle Observers
    private func startListening() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }
    
    // MARK: - First Launch Handling
    private func handleFirstLaunch() {
        if isFirstLaunch {
            logger.info("""
            ----------
            🚀 App started successfully.
            ----------
            """)
            isFirstLaunch = false
            foregroundStartTime = Date()
            appLaunchStartTime = Date()
        }
    }
    
    // MARK: - Background Transition Handling
    @objc private func appDidEnterBackground() {
        guard !isFirstLaunch else { return }

        currentState = .background

        // Calculate foreground duration
        if let start = foregroundStartTime {
            let duration = Date().timeIntervalSince(start)
            totalForegroundDuration += duration
        }
        
        backgroundStartTime = Date()
        
        // Increment the background transition count
        backgroundTransitionsCount += 1
        
        // Update the state values
        updateState()
        
        // Log the current app state
        logAppState("🌙 App moved to the background.")
    }
    
    // MARK: - Foreground Transition Handling
    @objc private func appWillEnterForeground() {
        guard !isFirstLaunch else { return }

        currentState = .foreground

        // Calculate background duration
        if let start = backgroundStartTime {
            let duration = Date().timeIntervalSince(start)
            totalBackgroundDuration += duration
        }
        
        foregroundStartTime = Date()
        
        // Update the state values
        updateState()
        
        // Log the current app state
        logAppState("🌞 App moved to the foreground.")
    }
    
    // MARK: - State Update
    private func updateState() {
        totalForegroundDurationFormatted = formatDuration(totalForegroundDuration)
        totalBackgroundDurationFormatted = formatDuration(totalBackgroundDuration)
        
        // Calculate the time since app launch
        if let appStart = appLaunchStartTime {
            let durationSinceLaunch = Date().timeIntervalSince(appStart)
            totalTimeSinceLaunchFormatted = formatDuration(durationSinceLaunch)
        }
        
        // Update the last background duration
        lastBackgroundDurationFormatted = {
            guard let start = backgroundStartTime else { return "0s" }
            let duration = Date().timeIntervalSince(start)
            return formatDuration(duration)
        }()
    }

    // MARK: - Logging
    private func logAppState(_ message: String) {
        logger.info("""
        ----------
        \(message)
        🌙 Total time spent in background: \(totalBackgroundDurationFormatted)
        🌞 Total time spent in foreground: \(totalForegroundDurationFormatted)
        🕒 Last background duration: \(lastBackgroundDurationFormatted)
        ⏱️ Time since app launch: \(totalTimeSinceLaunchFormatted)
        🔄 Total background transitions: \(backgroundTransitionsCount) times
        ----------
        """)
    }
    
    // MARK: - Helper Methods
    private func formatDuration(_ duration: TimeInterval) -> String {
        let hours = Int(duration) / 3600
        let minutes = (Int(duration) % 3600) / 60
        let seconds = Int(duration) % 60
        return "\(hours)h \(minutes)m \(seconds)s"
    }
}
