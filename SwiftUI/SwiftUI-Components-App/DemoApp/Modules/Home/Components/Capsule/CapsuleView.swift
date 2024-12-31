import SwiftUI

struct CapsuleView: View {
    @ObservedObject var presenter: CapsulePresenter
    @State private var startWidth: CGFloat = 150
    @State private var startHeight: CGFloat = 300

    var body: some View {
        // back button
        Button(action: presenter.goBack) {
            Image(systemName: "chevron.left")
                .font(.title2)
                .padding()
                .background(Color.gray.opacity(0.2))
                .clipShape(Circle())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
        VStack() {
            // Capsule Shape Created
            Text("Dynamic Capsule Shape")
                .padding()
            Capsule()
                .frame(width: startWidth, height: startHeight)
                .foregroundStyle(.red)
                .animation(.easeInOut, value: startWidth)
                .animation(.easeInOut, value: startHeight)

            Spacer()
                
            VStack {
                Text("Width \(startWidth)")
                Slider(value: $startWidth, in: 100...150, step: 1) {  // width must be between 100-150 to protect capsule shape
                    Text("Width")
                }
            }
            .padding()

            VStack {
                Text("Height \(startHeight)") // height must be always greater than width to get capsule shape
                Slider(value: $startHeight, in: 200...400, step: 1) {
                    Text("Height")
                }
            }
            .padding()

            Spacer()
        }
        .padding()
       
    }
}

