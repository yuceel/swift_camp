

import SwiftUI

struct ImageView: View {
    @ObservedObject var presenter: ImagePresenter
    var body: some View {
        Image("atatürk")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
        
        Button("Go Back") {
                presenter.goBack()
                        }
    }
        
}





