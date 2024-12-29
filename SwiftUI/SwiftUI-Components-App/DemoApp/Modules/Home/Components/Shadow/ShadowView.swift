import SwiftUI

struct ShadowView: View {
    @ObservedObject var presenter: ShadowPresenter
    
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

                // 1. Basic Shadow
                Text("Basic Shadow")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .frame(width: 300, height: 200)
                    .shadow(radius: 10)
                    .padding()

                // 2. Shadow with custom color
                Text("Shadow with Custom Color")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .frame(width: 300, height: 200)
                    .shadow(color: .purple, radius: 10)
                    .padding()

                // 3. Shadow with offset
                Text("Shadow with Offset")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.orange)
                    .frame(width: 300, height: 200)
                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                    .padding()

                // 4. Multiple shadows with different offsets
                Text("Multiple Shadows")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.pink)
                    .frame(width: 300, height: 200)
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                    .shadow(color: .gray, radius: 10, x: -5, y: -5)
                    .padding()

                // 5. Shadow on Text
                Text("Shadow on Text")
                    .font(.title)
                    .padding()
                Text("Hello, SwiftUI!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                    .shadow(color: .black, radius: 10, x: 0, y: 5)
                    .padding()

                // 6. Shadow with large radius and offset
                Text("Large Shadow with Offset")
                    .font(.title)
                    .padding()
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.red)
                    .frame(width: 300, height: 200)
                    .shadow(color: .black, radius: 20, x: 10, y: 10)
                    .padding()

            }
            .padding()
        }
    }
}
