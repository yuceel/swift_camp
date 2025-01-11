

import SwiftUI

struct CircleView: View {
    @ObservedObject var presenter: CirclePresenter
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 200, height: 200)
            .overlay(
                Text("EduTech")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            )
        Button("Go Back") {
                presenter.goBack()
                        }
            .shadow(radius: 10)
    }
}





