import SwiftUI

struct AnimationView: View {
    @State private var isScaled = false
    @State private var isRotated = false
    @State private var opacity: Double = 1.0
    @State private var position = CGSize(width: 0, height: 0)
    @State private var isVisible = true
    
    @ObservedObject var presenter: AnimationPresenter
    
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


                // 1. Basic Scale Animation
                Text("Scale Animation")
                    .font(.title)
                    .padding()
                Button(action: {
                    withAnimation {
                        isScaled.toggle()
                    }
                }) {
                    Text(isScaled ? "Scaled" : "Scale Me")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .scaleEffect(isScaled ? 1.5 : 1)
                }

                // 2. Rotation Animation
                Text("Rotation Animation")
                    .font(.title)
                    .padding()
                Button(action: {
                    withAnimation {
                        isRotated.toggle()
                    }
                }) {
                    Text(isRotated ? "Rotated" : "Rotate Me")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .rotationEffect(.degrees(isRotated ? 180 : 0))
                }

                // 3. Opacity Animation
                Text("Opacity Animation")
                    .font(.title)
                    .padding()
                Button(action: {
                    withAnimation {
                        opacity = (opacity == 1.0) ? 0.0 : 1.0
                    }
                }) {
                    Text("Fade Me")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .opacity(opacity)
                }

                // 4. Offset Animation
                Text("Offset Animation")
                    .font(.title)
                    .padding()
                Button(action: {
                    withAnimation {
                        position = position == CGSize.zero ? CGSize(width: 200, height: 200) : CGSize.zero
                    }
                }) {
                    Text("Move Me")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .offset(position)
                }

                // 5. Combined Animation (Rotation + Scale + Opacity)
                Text("Combined Animation")
                    .font(.title)
                    .padding()
                Button(action: {
                    withAnimation(.easeInOut(duration: 2)) {
                        isRotated.toggle()
                        isScaled.toggle()
                        opacity = (opacity == 1.0) ? 0.0 : 1.0
                    }
                }) {
                    Text("Animate Together")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .rotationEffect(.degrees(isRotated ? 180 : 0))
                        .scaleEffect(isScaled ? 1.5 : 1)
                        .opacity(opacity)
                }
            }
            .padding()
        }
    }
}
