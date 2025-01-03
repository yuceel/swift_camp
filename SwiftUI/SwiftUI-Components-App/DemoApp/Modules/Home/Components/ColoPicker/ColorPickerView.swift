import SwiftUI

struct ColorPickerView: View {

    @ObservedObject var presenter: ColorPickerPresenter

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

                    Text("Color Playground")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)

                Spacer()
                // Instruction Section
                VStack(spacing: 15) {
                    Text("Pick a Color")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)

                    Text("Select a color below and see the live preview. Your choice is applied instantly!")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                // Color Picker Section
                VStack(spacing: 20) {
                    ColorPicker("Choose Color", selection: $presenter.selectedColor)
                        .labelsHidden()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)

                    Text("Selected Color")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    RoundedRectangle(cornerRadius: 25)
                        .fill(presenter.selectedColor)
                        .frame(height: 180)
                        .overlay(
                            Text(presenter.selectedColor.description)
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(10),
                            alignment: .bottomTrailing
                        )
                        .shadow(color: presenter.selectedColor.opacity(0.5), radius: 15, x: 0, y: 10)
                }
                .padding()
            }
        }
        .background(Color(UIColor.systemBackground)) // Dynamic background for light and dark mode
        .edgesIgnoringSafeArea(.bottom)
    }
}
