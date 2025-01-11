

import SwiftUI

struct BindingView: View {
    @ObservedObject var presenter: BindingPresenter
    @State private var textValue: String = "Hello, World!"
    
    var body: some View {
        VStack {
            TextField("Enter text", text: $textValue)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("You typed: \(textValue)")

            Button("Change Text") {
                textValue = "New Text"
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        Button("Go Back") {
                presenter.goBack()
                        }
        .padding()
    }
}


