import SwiftUI

struct LabelView: View {
    let presenter: LabelPresenter

    var body: some View {
        ZStack {
            VStack {
                Label("Hello, SwiftUI!", systemImage: "star")
                    .padding()
                    .font(.title)
            }

            // Back Button
            VStack {
                HStack {
                    Button(action: presenter.goBack) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

