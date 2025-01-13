import SwiftUI

struct SCTextField: View {
    @Binding var text: String
    var type: TextFieldType
    var maxLength: Int? = nil
    var borderColor: Color = AppColors.darkGray
    var borderWidth: CGFloat = 1
    var cornerRadius: CGFloat = 7
    var backgroundColor: Color = AppColors.white
    var showPasswordToggle: Bool = true
    var isEnabled: Bool = true
 
    @State private var isPasswordVisible: Bool = false
    @State private var errorMessage: String? = nil
    @State private var criteria: [(description: String, isMet: Bool)] = []
 
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .trailing) {
                HStack {
                    if case .search = type {
                        Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    }
 
                    ZStack {
                        TextField(type.placeholder, text: $text)
                            .opacity(isPasswordVisible || type != .password ? 1 : 0)
                            .disabled(!isEnabled)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(type.keyboardType)

                        SecureField(type.placeholder, text: $text)
                            .opacity(!isPasswordVisible && type == .password ? 1 : 0)
                            .disabled(!isEnabled)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(type.keyboardType)
                    }
                }

                if case .password = type, !isPasswordVisible {
                    SecureField(placeholder, text: $text)
                        .textFieldStyle(PlainTextFieldStyle())
                        .keyboardType(keyboardType)
                        .autocapitalization(.none)
                        .disabled(!isEnabled)
                } else {
                    TextField(placeholder, text: $text)
                        .textFieldStyle(PlainTextFieldStyle())
                        .keyboardType(keyboardType)
                        .autocapitalization(.none)
                        .disabled(!isEnabled)

                .padding(8)
                .background(isEnabled ? backgroundColor : AppColors.lightGray)
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(isEnabled ? (errorMessage == nil ? borderColor : .red) : AppColors.lightGray, lineWidth: borderWidth)
                )

                if case .password = type, showPasswordToggle, isEnabled {
                    Button(action: { isPasswordVisible.toggle() }) {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }

                }
            }

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.top, 4)
                    .transition(.opacity)
                    .animation(.easeInOut, value: errorMessage)
            }

            if type == .password {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(criteria.indices, id: \ .self) { index in
                        HStack {
                            Image(systemName: criteria[index].isMet ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(criteria[index].isMet ? .green : .red)
                            Text(criteria[index].description)
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 4)
                .opacity(criteria.allSatisfy { $0.isMet } ? 0 : 1)
            }
        }
        .onChange(of: text) { newValue in
            if let maxLength = maxLength, newValue.count > maxLength {
                text = String(newValue.prefix(maxLength))
            }
            validateInput(newValue) // Validate input here
        }
        .onAppear {
            if type == .password {
                
            }
        }
    }

    /// Validates the input text and updates the error message.
    private func validateInput(_ value: String) {
        errorMessage = type.validate(value) // Call validate from TextFieldType

        
    }

    /// Generates password criteria descriptions and their initial states.
    
}

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
 
    var body: some View {
        VStack(spacing: 16) {
            SCTextField(text: $username, type: .username, borderColor: .blue)
            SCTextField(text: $password, type: .password, borderColor: .green, showPasswordToggle: true)
            SCTextField(text: $email, type: .email, borderColor: .orange)
        }
        .padding()
    }
}

#Preview {
    VStack(spacing: 16) {
        SCTextField(text: .constant(""), type: .username)
        SCTextField(text: .constant(""), type: .password, borderColor: .red, showPasswordToggle: true, isEnabled: true)
        SCTextField(text: .constant(""), type: .email, borderColor: .green)
        SCTextField(text: .constant(""), type: .search, borderColor: .gray, isEnabled: false)
        SCTextField(text: .constant(""), type: .custom(placeholder: "Enter custom input", keyboardType: .asciiCapable), borderColor: .orange)
    }
    .padding()
}


