import SwiftUI

struct FrameView: View {

    @ObservedObject var presenter: FramePresenter

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

                    Text("Frame Modifier Playground")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)

                // Rectangle Section
                VStack(spacing: 20) {
                    Text("Dynamic Square")
                        .font(.headline)
                        .foregroundColor(.primary)

                    Rectangle()
                        .fill(presenter.color) // Dynamic color based on ColorPicker
                        .frame(width: presenter.size, height: presenter.size) // Use single size property
                        .cornerRadius(15)
                        .shadow(color: presenter.color.opacity(0.4), radius: 10, x: 0, y: 5)

                    Text("Size: \(Int(presenter.size)) x \(Int(presenter.size))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)

                // Controls Section
                VStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Adjust Size")
                            .font(.subheadline)
                            .foregroundColor(.primary)

                        Slider(value: $presenter.size, in: 50...300, step: 1) // Single slider for size
                            .accentColor(.blue)
                    }

                    VStack(alignment: .leading) {
                        Text("Select Color")
                            .font(.subheadline)
                            .foregroundColor(.primary)

                        ColorPicker("", selection: $presenter.color) // Dynamic ColorPicker
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
