import SwiftUI

struct RectangleView: View {

    @ObservedObject var presenter: RectanglePresenter

    var body: some View {
        ScrollView {
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

                    Text("Rectangle Playground")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)

                // Rectangle Display Section
                VStack(spacing: 20) {
                    Rectangle()
                        .fill(presenter.color)
                        .frame(width: presenter.width, height: presenter.height)
                        .cornerRadius(10)
                        .shadow(color: presenter.color.opacity(0.4), radius: 10, x: 0, y: 5)

                    Text("Width: \(Int(presenter.width)) • Height: \(Int(presenter.height))")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)

                // Controls Section
                VStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Adjust Width")
                            .font(.subheadline)
                            .foregroundColor(.primary)

                        Slider(value: $presenter.width, in: max(presenter.height + 10, 50)...300, step: 1)
                            .accentColor(.blue)
                    }

                    VStack(alignment: .leading) {
                        Text("Adjust Height")
                            .font(.subheadline)
                            .foregroundColor(.primary)

                        Slider(value: $presenter.height, in: 50...(presenter.width - 10), step: 1)
                            .accentColor(.blue)
                    }

                    VStack(alignment: .leading) {
                        Text("Select Color")
                            .font(.subheadline)
                            .foregroundColor(.primary)

                        ColorPicker("", selection: $presenter.color)
                            .labelsHidden()
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .background(Color(UIColor.systemBackground)) // Dynamic background for light and dark mode
        .edgesIgnoringSafeArea(.bottom)
    }
}
