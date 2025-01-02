import SwiftUI

struct MagnificationGestureView: View {
    @ObservedObject var presenter: MagnificationGesturePresenter
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    
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
            
            Text("Pinch to Zoom")
                .font(.title)
                .padding()
            
            // Demo Image with Magnification
            Image(systemName: "photo")
                .font(.system(size: 100))
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = lastScale * value
                        }
                        .onEnded { _ in
                            lastScale = scale
                        }
                )
            
            // Reset Button
            Button("Reset Zoom") {
                withAnimation {
                    scale = 1.0
                    lastScale = 1.0
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("Current Scale: \(scale, specifier: "%.2f")x")
                .font(.caption)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}