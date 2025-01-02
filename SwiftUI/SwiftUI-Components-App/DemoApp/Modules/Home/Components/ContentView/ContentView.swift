import SwiftUI

struct ContentView: View {

    @ObservedObject var presenter: ContentPresenter

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Go-back button
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
                }
                .padding(.horizontal)

                // Main content
                VStack(spacing: 20) {
                    // Decorative question mark element
                    ZStack {
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 150, height: 150)
                            .shadow(color: Color.purple.opacity(0.5), radius: 10, x: 0, y: 5)

                        Image(systemName: "questionmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }

                    // App title
                    Text("About This App")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    // Description
                    Text("""
                         This app demonstrates the use of VIPER architecture in a SwiftUI project. 
                         Each component is designed to showcase SwiftUI's powerful features combined with a well-structured architecture.
                         
                         You can explore different components and view examples.
                         """)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 20)
                }
                .padding()

                Spacer()
            }
        }
        .background(Color(UIColor.systemBackground)) // Dynamic background for light and dark mode
        .edgesIgnoringSafeArea(.bottom)
        .padding()
    }
}
