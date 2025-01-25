import SwiftUI

struct OTPInputFieldView: View {
    private let correctOTP = "123456"
    private let length: Int = 6
    @State private var otpText = ""
    @State private var isError: Bool = false
    @State private var errorMessage: String = ""
    @FocusState private var isKeyboardShowing: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<length, id: \.self) { index in
                    OTPTextBox(index)
                }
            }
            .background(content: {
                TextField("", text: $otpText.limit(length))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
                    .onChange(of: otpText) { newValue in
                        if newValue.count == length {
                            checkOTP(newValue)
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            isKeyboardShowing = true
                        }
                    }
            })
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardShowing = true
            }
            
            if isError {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 5)
            }
            
            Button(action: {
                checkOTP(otpText)
            }) {
                Text("Verify OTP")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top)
        }
    }
    
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            if otpText.count > index {
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            let backgroundColor = isError ? Color.red : Color.gray
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(backgroundColor)
        }
        .padding(.horizontal, 8)
    }

    private func checkOTP(_ enteredOTP: String) {
        if enteredOTP == correctOTP {
            isError = false
            errorMessage = ""
            print("Correct OTP")
        } else {
            isError = true
            errorMessage = "Incorrect OTP. Please try again."
            otpText = ""
        }
    }
}

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}

#Preview {
    OTPInputFieldView()
}
