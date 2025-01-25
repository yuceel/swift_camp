import SwiftUI

struct LoginView: View {
    @ObservedObject var presenter: LoginPresenter

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hi, Welcome! 👋")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Email address or phone number")
                TextField("Your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Password")
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack {
                Toggle("Remember me", isOn: $rememberMe)
                    .toggleStyle(SwitchToggleStyle(tint: .black))
                Spacer()
                Button("Forgot password?") {}
                    .foregroundColor(.blue)
            }
            
            Button(action: {
                presenter.handleLogin(email: email, password: password)
            }) {
                Text("Log in")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Text("Or with")
                .font(.footnote)
                .foregroundColor(.gray)
            
            HStack(spacing: 20) {
                Button(action: {
                    presenter.handleGitHubLogin()
                }) {
                    HStack {
                        Image("githubLogo")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("GitHub")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                
                Button(action: {
                    presenter.handleGoogleLogin()
                }) {
                    HStack {
                        Image("googleLogo")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Google")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                
                Button(action: {
                    presenter.handleAppleLogin()
                }) {
                    HStack {
                        Image(systemName: "applelogo")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Apple")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            
            Spacer()
            HStack {
                Text("Don’t have an account?")
                Button("Sign up") {}
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = LoginPresenter(wireframe: LoginWireframe())
        return LoginView(presenter: presenter)
    }
}
