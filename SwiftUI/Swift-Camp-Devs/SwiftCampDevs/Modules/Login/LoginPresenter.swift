import FirebaseAuth
import GoogleSignIn
import UIKit
import FacebookLogin

final class LoginPresenter: ObservableObject {
    private let wireframe: LoginWireframeInterface

    init(wireframe: LoginWireframeInterface) {
        self.wireframe = wireframe
    }

    // MARK: - Google Login
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

    // MARK: - GitHub Login
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

    // MARK: - Facebook Login
    func handleFacebookLogin() {
        let loginManager = LoginManager()
        
        
        loginManager.logIn(permissions: ["public_profile", "email"], from: nil) { [weak self] result, error in
            if let error = error {
                print("Facebook login failed: \(error.localizedDescription)")
                return
            }

            guard let result = result, !result.isCancelled else {
                print("Facebook login was cancelled.")
                return
            }

            guard let accessToken = AccessToken.current else {
                print("Failed to get Facebook access token.")
                return
            }

            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign-In with Facebook failed: \(error.localizedDescription)")
                } else {
                    print("User signed in with Facebook: \(authResult?.user.email ?? "No email")")
                    self?.handleSuccessfulLogin()
                }
            }
        }
    }


    // MARK: - Successful Login
    func handleSuccessfulLogin() {
        print("Login was successful!")
        wireframe.navigateToHome()
    }
}
