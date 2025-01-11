import SwiftUI


struct RotationGestureView: View {
    
    @ObservedObject var presenter: RotationGesturePresenter
    @State private var rotation: Angle = .degrees(0)
    let backButtonIcon: String = "chevron.left"
    
    var body: some View {
        VStack(spacing: 30) {
            Button(action: presenter.goBack) {
                Image(systemName: backButtonIcon)
                    .font(.title2)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            
            Text("Rotatable Text")
                .frame(width: 175, height: 90)
                .padding()
                .background(.black)
                .foregroundStyle(.white)
                .rotationEffect(rotation)
                .gesture(
                    RotationGesture()
                        .onChanged {
                            value in
                            rotation = value
                        }
                )
            Spacer()
        }
        
    }
}

