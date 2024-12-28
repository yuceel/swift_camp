import SwiftUI

struct RectangleView: View {

    @ObservedObject var presenter: RectanglePresenter

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

            // Rectangle Display
            Rectangle()
                .fill(presenter.color)
                .frame(width: presenter.width, height: presenter.height)
                .cornerRadius(10)
                .shadow(radius: 5)

            // Controls to Modify Rectangle
            VStack(spacing: 20) {
                Slider(value: $presenter.width, in: 50...300, step: 1) {
                    Text("Width")
                }
                .padding()

                Slider(value: $presenter.height, in: 50...300, step: 1) {
                    Text("Height")
                }
                .padding()

                ColorPicker("Select Color", selection: $presenter.color)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
}
