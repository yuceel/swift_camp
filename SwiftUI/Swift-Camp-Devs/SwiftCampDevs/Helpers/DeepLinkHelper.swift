import UIKit
 
struct DeepLinkHelper {

    /// Attempts to open a deep link URL.

    /// - Parameter deepLinkString: The deep link (e.g., "myapp://some/resource").

    static func open(_ deepLinkString: String) {

        guard let deepLinkURL = URL(string: deepLinkString) else {

            logError(message: "The deep link provided is invalid.")

            return

        }

        guard UIApplication.shared.canOpenURL(deepLinkURL) else {

            logError(message: "The required application is not installed on this device.")

            return

        }
       
        UIApplication.shared.open(deepLinkURL, options: [:]) { success in

            if !success {

                logError(message: "Failed to open the application.")

            }

        }

    }

    // MARK: - Private Helper Methods
 
    /// Logs an error and optionally displays a message to the user

    private static func logError(message: String) {

        // Log the error using LoggerHelper

        LoggerHelper.shared.error(message)

        // You can also trigger other UI actions here like showing a snackbar or notification

        // showErrorSnackbar(message: message)

    }

}

 
