import SwiftUI

struct ScaleEffectView: View {
    @State private var scale: CGFloat = 1.0
    @State private var rotated: Bool = false
    @ObservedObject var presenter : ScaleEffectPresenter

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Back button (optional)
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                // 1. Basic scaleEffect usage
                Text("Basic scaleEffect")
                    .font(.title)
                    .padding()
                Image(systemName: "star.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.yellow)
                    .scaleEffect(1.5)  // Scaling the image by 1.5 times
                    .padding()

                // 2. Scaling with user interaction (tap gesture)
                Text("Tap to scale up and down")
                    .font(.title)
                    .padding()
                Image(systemName: "heart.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.red)
                    .scaleEffect(scale)  // Scaling dynamically based on state
                    .onTapGesture {
                        // Toggle between 1.0 and 2.0 scale
                        scale = scale == 1.0 ? 2.0 : 1.0
                    }
                    .padding()

                // 3. Animated scale effect
                Text("Animated scale effect")
                    .font(.title)
                    .padding()
                Image(systemName: "circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                    .scaleEffect(rotated ? 1.5 : 1.0)  // Animate scale effect
                    .onTapGesture {
                        withAnimation {
                            rotated.toggle()  // Toggle scale with animation
                        }
                    }
                    .padding()

                // 4. Scaling in different directions (x and y axis)
                Text("Scaling in X and Y directions")
                    .font(.title)
                    .padding()
                Image(systemName: "cloud.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.green)
                    .scaleEffect(x: 2.0, y: 1.0)  // Scale only along the x-axis
                    .padding()

                // 5. Scaling with different anchor points
                Text("Scaling with custom anchor")
                    .font(.title)
                    .padding()
                Image(systemName: "star.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.orange)
                    .scaleEffect(1.5, anchor: .bottomTrailing)  // Scale with a custom anchor point
                    .padding()
                
                // 6. Combining scaleEffect with rotation
                Text("Scale and Rotate")
                    .font(.title)
                    .padding()
                Image(systemName: "star.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.purple)
                    .scaleEffect(1.5)
                    .rotationEffect(.degrees(45))  // Combining scale with rotation
                    .padding()
            }
            .padding()
        }
    }
}
