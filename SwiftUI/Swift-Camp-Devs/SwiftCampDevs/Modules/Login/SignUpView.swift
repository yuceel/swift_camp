import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String? = nil
    @State private var isLoading: Bool = false

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Create an Account")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            VStack(alignment: .leading, spacing: 10) {
                Text("Email")
                TextField("Enter your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                Text("Password")
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Confirm Password")
                SecureField("Confirm your password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }

            Button(action: registerUser) {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.top, 10)

            Spacer()
        }
        .padding()
    }

    
    private func registerUser() {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "Please fill out all fields."
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }

        isLoading = true
        errorMessage = nil

        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            isLoading = false

            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                print("User registered successfully: \(result?.user.uid ?? "No UID")")
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

