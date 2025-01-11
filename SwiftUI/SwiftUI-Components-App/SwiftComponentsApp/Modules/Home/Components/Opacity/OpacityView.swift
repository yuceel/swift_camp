import SwiftUI

struct OpacityView: View {
    @ObservedObject var presenter: OpacityPresenter
    @State private var opacity: Double = 1.0
    
    var body: some View {
        VStack {
            Text("EduTech")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .opacity(opacity)

            Slider(value: $opacity, in: 0...1)
                .padding()
                .accentColor(.blue)

            Button(action: {
                
                opacity = 0.5
            }) {
                Text("Set Opacity to 0.5")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        Button("Go Back") {
            presenter.goBack()
                        }
        .padding()
    }
}
