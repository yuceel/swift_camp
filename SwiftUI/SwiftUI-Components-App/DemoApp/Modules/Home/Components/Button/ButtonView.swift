import SwiftUI

struct ButtonView: View {
    @State private var counter = 0
    @State private var isButtonPressed = false
    @ObservedObject var presenter:ButtonPresenter
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                // 1. Simple Button
                Button("Simple Button") {
                    print("Simple Button Pressed!")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                // 2. Button with Counter
                Button("Increment Counter: \(counter)") {
                    counter += 1
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                // 3. Button with Pressed State
                Button(action: {
                    isButtonPressed.toggle()
                }) {
                    Text(isButtonPressed ? "Pressed!" : "Press Me")
                        .padding()
                        .background(isButtonPressed ? Color.red : Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                // 4. Button with Icon
                Button(action: {
                    print("Icon Button Pressed")
                }) {
                    HStack {
                        Image(systemName: "star.fill")
                        Text("Star Button")
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                
                // 5. Button with Custom Font and Alignment
                Button("Custom Font Button") {
                    print("Custom Font Button Pressed")
                }
                .padding()
                .font(.title2)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .frame(maxWidth: .infinity, alignment: .center)
                
                // 6. Button with Shadow
                Button("Button with Shadow") {
                    print("Button with Shadow Pressed")
                }
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(8)
                .shadow(radius: 10)
                
                // 7. Disabled Button
                Button("Disabled Button") {
                    print("This should not print.")
                }
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .disabled(true)
            }
            .padding()
        }
    }
}
