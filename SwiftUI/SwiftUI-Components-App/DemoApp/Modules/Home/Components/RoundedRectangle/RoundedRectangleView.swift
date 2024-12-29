import SwiftUI

struct RoundedRectangleView: View {
    @ObservedObject var presenter : RoundedRectanglePresenter
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Button to go back (can be added if necessary)
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                // 1. Basic RoundedRectangle
                Text("Basic RoundedRectangle")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 300, height: 200)
                    .foregroundColor(.blue)
                    .padding()

                // 2. RoundedRectangle with custom corner radius
                Text("Custom Corner Radius")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 300, height: 200)
                    .foregroundColor(.green)
                    .padding()

                // 3. RoundedRectangle with Border
                Text("RoundedRectangle with Border")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.red, lineWidth: 5)
                    .frame(width: 300, height: 200)
                    .padding()

                // 4. RoundedRectangle with Shadow
                Text("RoundedRectangle with Shadow")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
                    .frame(width: 300, height: 200)
                    .shadow(color: .gray, radius: 10, x: 0, y: 5)
                    .padding()

                // 5. RoundedRectangle with Gradient Background
                Text("RoundedRectangle with Gradient")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 300, height: 200)
                    .padding()

                // 6. RoundedRectangle with Clipped Image (Fix applied here)
                Text("RoundedRectangle with Image")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 30)
                    .overlay(
                        Image("exampleImage") // Replace "exampleImage" with your image name
                            .resizable()
                            .scaledToFill()
                            .clipped()
                    )
                    .frame(width: 300, height: 200)
                    .padding()

            }
            .padding()
        }
    }
}
