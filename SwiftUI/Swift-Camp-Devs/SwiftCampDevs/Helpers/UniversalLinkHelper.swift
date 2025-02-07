import Foundation
import UIKit

struct UniversalLinkHelper {
    static func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        
        UIApplication.shared.open(url, options: [:]) { success in
            if !success {
                print("Cannot open URL: \(urlString)")
            }
        }
    }
}
