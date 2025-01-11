import Foundation
import SwiftyBeaver

// MARK: - LoggerHelper
final class LoggerHelper {
    // MARK: - Shared Instance
    static let shared = LoggerHelper()

    // MARK: - Logger
    private let logger: SwiftyBeaver.Type = {
        let logger = SwiftyBeaver.self
        let console = ConsoleDestination()
        
        // Customize console log format
        console.format = "$DHH:mm:ss$d $L $M"
        
        logger.addDestination(console)
        return logger
    }()

    // MARK: - Initialization
    private init() {}

    // MARK: - Logging Methods

    /// Logs an informational message.
    /// - Parameter message: The message to log.
    func info(_ message: String) {
        logger.info("ℹ️ \(message)")
    }

    /// Logs a debug message.
    /// - Parameter message: The message to log.
    func debug(_ message: String) {
        logger.debug("🐛 \(message)")
    }

    /// Logs a warning message.
    /// - Parameter message: The message to log.
    func warning(_ message: String) {
        logger.warning("⚠️ \(message)")
    }

    /// Logs an error message.
    /// - Parameter message: The message to log.
    func error(_ message: String) {
        logger.error("❌ \(message)")
    }

    /// Logs a verbose message.
    /// - Parameter message: The message to log.
    func verbose(_ message: String) {
        logger.verbose("🔍 \(message)")
    }
}
