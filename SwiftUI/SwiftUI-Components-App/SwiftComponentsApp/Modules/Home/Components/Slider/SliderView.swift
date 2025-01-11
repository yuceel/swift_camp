import SwiftUI

struct SliderView: View {
    @ObservedObject var presenter: SliderPresenter
    @State private var sliderValue: Double = 50 // Dynamic value for the slider

    var body: some View {
        ZStack {
            // Main content
            VStack {
                // Slider to allow the user to select a value
                Slider(value: $sliderValue, in: 0...100)
                    .padding()

                // Display the current value of the slider
                Text("Slider Value: \(Int(sliderValue))")
                    .padding()
            }

            // Back Button positioned at the top-left corner
            VStack {
                HStack {
                    Button(action: presenter.goBack) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                    Spacer() // Push the content away horizontally
                }
                Spacer() // Push the content away vertically
            }
            .padding() // Add padding to avoid touching the screen edges
        }
    }
}

