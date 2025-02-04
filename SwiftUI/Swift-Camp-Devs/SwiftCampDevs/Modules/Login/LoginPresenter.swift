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

            let credential = GoogleAuthProvider.credential(withIDToken: authentication.tokenString, accessToken: result!.user.accessToken.tokenString)

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

    func handleSuccessfulLogin() {
        print("Login was successful!")
        wireframe.navigateToHome()
    }
}
