import Foundation
import UIKit
import MapKit

/// Enum to represent various deep link types.
enum DeepLinkType {
    case phone(number: String)
    case map(location: String)
    case email(to: String)
    case unknown
}

/// Helper class to parse and handle deep links.
class DeepLinkHelper {
    
    /// Parses the given URL to identify the deep link type.
    /// - Parameter url: The deep link URL.
    /// - Returns: The corresponding DeepLinkType.
    func parseDeepLink(from url: URL) -> DeepLinkType {
        guard let scheme = url.scheme else {
            return .unknown
        }
        
        switch scheme {
        case "tel":
            return .phone(number: url.absoluteString.replacingOccurrences(of: "tel:", with: ""))
        case "maps":
            return .map(location: url.absoluteString.replacingOccurrences(of: "maps:", with: ""))
        case "mailto":
            return .email(to: url.absoluteString.replacingOccurrences(of: "mailto:", with: ""))
        default:
            return .unknown
        }
    }
    
    /// Handles the parsed deep link and performs the necessary action.
    /// - Parameters:
    ///   - deepLink: The parsed DeepLinkType.
    ///   - navigationController: The navigation controller to present view controllers if needed.
    func handleDeepLink(_ deepLink: DeepLinkType, navigationController: UINavigationController?) {
        switch deepLink {
        case .phone(let number):
            callPhoneNumber(number)
        
        case .map(let location):
            openMap(with: location)
        
        case .email(let recipient):
            openMail(to: recipient)
        
        case .unknown:
            print("Unknown deep link. No action taken.")
        }
    }
    
    /// Initiates a phone call to the specified number.
    private func callPhoneNumber(_ number: String) {
        guard let phoneURL = URL(string: "tel:\(number)") else { return }
        if UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        }
    }
    
    /// Opens the default map app to the specified location.
    private func openMap(with location: String) {
        let mapURLString = "http://maps.apple.com/?q=\(location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        if let mapURL = URL(string: mapURLString) {
            UIApplication.shared.open(mapURL, options: [:], completionHandler: nil)
        }
    }
    
    /// Opens the default mail app with a given recipient.
    private func openMail(to recipient: String) {
        guard let mailURL = URL(string: "mailto:\(recipient)") else { return }
        if UIApplication.shared.canOpenURL(mailURL) {
            UIApplication.shared.open(mailURL, options: [:], completionHandler: nil)
        }
    }
}
