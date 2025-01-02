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
                        .frame(width: presenter.size, height: presenter.size / 2) // Aspect ratio applied
                        .cornerRadius(10)
                        .shadow(color: presenter.color.opacity(0.4), radius: 10, x: 0, y: 5)

                    Text("Size: \(Int(presenter.size)) x \(Int(presenter.size / 2))")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)

                // Single Slider Section
                VStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Adjust Size")
                            .font(.subheadline)
                            .foregroundColor(.primary)

                        Slider(
                            value: $presenter.size,
                            in: 50...300,
                            step: 1
                        )
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
