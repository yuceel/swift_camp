import SwiftUI

struct FrameView: View {

    @ObservedObject var presenter: FramePresenter

    var body: some View {
        VStack(spacing: 30) {
            // Header Section
            HStack {
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }

                Spacer()

                Text("Frame Modifier Playground")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)

            Spacer()

            // Rectangle Section
            VStack(spacing: 20) {
                Text("Dynamic Rectangle")
                    .font(.headline)
                    .foregroundColor(.primary)

                Rectangle()
                    .fill(Color.blue)
                    .frame(width: presenter.width, height: presenter.height)
                    .cornerRadius(15)
                    .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)

                Text("Width: \(Int(presenter.width)) • Height: \(Int(presenter.height))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            // Sliders Section
            VStack(spacing: 30) {
                VStack(alignment: .leading) {
                    Text("Adjust Width")
                        .font(.subheadline)
                        .foregroundColor(.primary)

                    Slider(value: $presenter.width, in: 50...300, step: 1)
                        .accentColor(.blue)
                }

                VStack(alignment: .leading) {
                    Text("Adjust Height")
                        .font(.subheadline)
                        .foregroundColor(.primary)

                    Slider(value: $presenter.height, in: 50...300, step: 1)
                        .accentColor(.blue)
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .background(Color(UIColor.systemBackground))
        .edgesIgnoringSafeArea(.bottom)
        .padding()
    }
}
