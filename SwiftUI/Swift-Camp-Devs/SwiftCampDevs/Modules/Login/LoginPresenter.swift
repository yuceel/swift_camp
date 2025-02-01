import Foundation
import Combine

final class LoginPresenter: ObservableObject {
    private let wireframe: LoginWireframeInterface

    init(wireframe: LoginWireframeInterface) {
        self.wireframe = wireframe
    }

    func handleLogin(email: String, password: String) {
        print("Logging in with email: \(email), password: \(password)")
    }

    func handleGitHubLogin() {
        print("GitHub Login")
    }

    func handleGoogleLogin() {
        print("Google Login")
    }

    func handleAppleLogin() {
        print("Apple Login")
    }
}
