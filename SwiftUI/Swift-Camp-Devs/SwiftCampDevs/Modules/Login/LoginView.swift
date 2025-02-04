import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @ObservedObject var presenter: LoginPresenter

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var errorMessage: String?
    @State private var isLoading: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Hi, Welcome! 👋")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email address or phone number")
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)

                    Text("Password")
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                HStack {
                    Toggle("Remember me", isOn: $rememberMe)
                        .toggleStyle(SwitchToggleStyle(tint: .black))
                    Spacer()
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Forgot password?")
                    }
                    .foregroundColor(.blue)
                }

                
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.footnote)
                }

                
                Button(action: loginWithFirebase) {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Log in")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }

                Text("Or with")
                    .font(.footnote)
                    .foregroundColor(.gray)

                
                Button(action: {
                    presenter.handleGoogleLogin()
                }) {
                    HStack {
                        Image("googleLogo")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Continue with Google")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }

                Spacer()

                
                HStack {
                    Text("Don’t have an account?")
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.blue)
                }
            }
            .padding()
        }
    }

    private func loginWithFirebase() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password."
            return
        }

        isLoading = true
        errorMessage = nil

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isLoading = false

            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                print("User signed in: \(result?.user.uid ?? "No UID")")
                presenter.handleSuccessfulLogin()
            }
        }
    }
}
