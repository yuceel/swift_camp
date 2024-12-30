import SwiftUI

struct AlertView: View {
    @ObservedObject var presenter: AlertPresenter
    @State private var showAlert: Bool = false

    var body: some View {
        ZStack {
            VStack {
                // Back Button positioned at the top-left corner
                HStack {
                    Button(action: presenter.goBack) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                    Spacer() // Push content horizontally
                }
                .padding() // Add padding to the top and sides
                
                Spacer() // Push the rest of the content down
            }
            
            // Main content
            VStack(spacing: 16) {
                Text("Alert View")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Tap the button below to see an alert.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()

                Button(action: {
                    showAlert = true
                }) {
                    Text("Show Alert")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Alert!"),
                        message: Text("This is an example alert."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .padding()
        }
    }
}

