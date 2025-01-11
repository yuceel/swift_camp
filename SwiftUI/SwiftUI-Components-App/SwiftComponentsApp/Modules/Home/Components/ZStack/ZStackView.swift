import SwiftUI

struct ZStackView: View {
    
    @ObservedObject var presenter: ZStackPresenter
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                Text("This is the ZStack View")
                    .font(.title)
                    .foregroundColor(.white)
                
                Button("Go Back") {
                    presenter.goBack()
                }
                .padding()
                .background(Color.white)
                .foregroundColor(.blue)
                .cornerRadius(10)
            }
        }
    }
}
