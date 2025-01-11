import SwiftUI

struct ConfirmationDialogView: View {
    @ObservedObject var presenter: ConfirmationDialogPresenter

    var body: some View {
        VStack(spacing: 20) {
            //Go back button
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Text("Selected Option: \(presenter.selectedOption)")
                .padding()

            Button("Show Options") {
                presenter.showDialog = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
            .confirmationDialog(
                "Choose an option",
                isPresented: $presenter.showDialog,
                titleVisibility: .visible
            ) {
                Button("Option 1") { presenter.selectedOption = "Option 1" }
                Button("Option 2") { presenter.selectedOption = "Option 2" }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please select one of the options below.")
            }
            
            Spacer()
        }
        .padding()
    }
}
