import SwiftUI

struct ForegroundColorView: View {
    @ObservedObject var presenter: ForegroundColorPresenter
    @State private var color: Color = .blue

    var body: some View {
        ZStack {
            VStack {
                // Back Button positioned at the top-left corner
                HStack {
                    Button(action: presenter.goBack) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                    Spacer() // Push content horizontally
                }
                .padding() // Add padding to the top and sides
                
                Spacer() // Push the rest of the content down
            }
            
            // Main content
            VStack(spacing: 16) {
                Text("Foreground Color View")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Tap the button below to change the foreground color randomly.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()

                Button(action: {
                    color = Color(
                        red: Double.random(in: 0...1),
                        green: Double.random(in: 0...1),
                        blue: Double.random(in: 0...1)
                    )
                }) {
                    Text("Change Color")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(color)
                        .cornerRadius(8)
                }
                .padding(.horizontal)

                Circle()
                    .fill(color)
                    .frame(width: 100, height: 100)
                    .padding()
            }
            .padding()
        }
    }
}

