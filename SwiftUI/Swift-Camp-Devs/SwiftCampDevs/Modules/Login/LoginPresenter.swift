import FirebaseAuth
import GoogleSignIn
import UIKit

final class LoginPresenter: ObservableObject {
    private let wireframe: LoginWireframeInterface

    init(wireframe: LoginWireframeInterface) {
        self.wireframe = wireframe
    }

    func handleGoogleLogin() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                print("Google Sign-In failed: \(error.localizedDescription)")
                return
            }

            guard let authentication = result?.user.idToken else {
                print("Failed to get Google ID Token")
                return
            }

            let credential = GoogleAuthProvider.credential(
                withIDToken: authentication.tokenString,
                accessToken: result!.user.accessToken.tokenString
            )

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign-In with Google failed: \(error.localizedDescription)")
                } else {
                    print("User signed in with Google: \(authResult?.user.email ?? "No email")")
                    self.handleSuccessfulLogin()
                }
            }
        }
    }

    
    func handleGitHubLogin() {
        let provider = OAuthProvider(providerID: "github.com")
        
        
        provider.scopes = ["user:email"]
        provider.customParameters = [
            "allow_signup": "false"
        ]

        provider.getCredentialWith(nil) { [weak self] credential, error in
            if let error = error {
                print("GitHub login failed: \(error.localizedDescription)")
                return
            }

            guard let credential = credential else {
                print("Failed to get GitHub credential")
                return
            }

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase GitHub login failed: \(error.localizedDescription)")
                } else {
                    print("User signed in with GitHub: \(authResult?.user.email ?? "No email")")
                    self?.handleSuccessfulLogin()
                }
            }
        }
    }

    
    func handleSuccessfulLogin() {
        print("Login was successful!")
        wireframe.navigateToHome()
    }
}
