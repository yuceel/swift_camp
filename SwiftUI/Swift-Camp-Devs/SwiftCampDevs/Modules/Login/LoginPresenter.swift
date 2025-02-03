import Foundation
import Combine
import FirebaseAuth

final class LoginPresenter: ObservableObject {
    private let wireframe: LoginWireframeInterface

    @Published var loginState: String? = nil
    private var cancellables = Set<AnyCancellable>()

    init(wireframe: LoginWireframeInterface) {
        self.wireframe = wireframe
    }

    func handleLogin(email: String, password: String) {
        print("Logging in with email: \(email)")

        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.loginState = "Login failed: \(error.localizedDescription)"
            } else {
                self?.loginState = "Login successful!"
                self?.handleSuccessfulLogin()
            }
        }
    }

    func handleSuccessfulLogin() {
        print("Login was successful! Navigating to next screen.")
        
        wireframe.navigateToHome()
    }

    func handleGitHubLogin() {
        print("GitHub Login (Henüz implemente edilmedi)")
    }

    func handleGoogleLogin() {
        print("Google Login (Henüz implemente edilmedi)")
    }

    func handleAppleLogin() {
        print("Apple Login (Henüz implemente edilmedi)")
    }
}
