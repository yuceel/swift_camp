import SwiftUI

struct ColorPickerView: View {

    @ObservedObject var presenter: ColorPickerPresenter

    var body: some View {
        VStack(spacing: 20) {
            // Go back button
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            // ColorPicker
            Text("Pick a Color")
                .font(.headline)

            ColorPicker("Choose your favorite color", selection: $presenter.selectedColor)
                .padding()
                .labelsHidden()

            // Display the selected color
            Rectangle()
                .fill(presenter.selectedColor)
                .frame(height: 100)
                .cornerRadius(10)
                .shadow(radius: 5)

            Spacer()
        }
        .padding()
    }
}
