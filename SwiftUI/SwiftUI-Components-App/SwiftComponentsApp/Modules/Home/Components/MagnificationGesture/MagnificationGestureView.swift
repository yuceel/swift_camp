import SwiftUI

struct MagnificationGestureView: View {
    @ObservedObject var presenter: MagnificationGesturePresenter
    @State private var lastScale: CGFloat = 1.0
    @State private var sliderValue: CGFloat = 1.0

    var body: some View {
        VStack(spacing: 20) {
            // Back button with consistent style
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)

            // Image with magnification gesture
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 200)
                    .overlay(
                        Text("Demo Image")
                            .font(.headline)
                            .foregroundColor(.gray)
                    )
                    .scaleEffect(presenter.scale * sliderValue)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                presenter.onMagnificationChanged(value * lastScale)
                            }
                            .onEnded { _ in
                                lastScale = presenter.scale
                            }
                    )
                    .animation(.spring(), value: presenter.scale)
            }

            // Show current scale value
            Text("Zoom: \(String(format: "%.1f", presenter.scale * sliderValue))x")
                .font(.title3)
                .bold()

            // Slider control
            Slider(value: $sliderValue, in: 0.5...3.0, step: 0.1)
                .padding()

            // Reset button
            Button("Reset") {
                presenter.onMagnificationEnded()
                sliderValue = 1.0
                lastScale = 1.0
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}
