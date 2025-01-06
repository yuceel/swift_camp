import SwiftUI

struct PathView: View {
    @ObservedObject var presenter: PathPresenter

    var body: some View {
        ZStack {
            VStack {
                Path { path in
                    let startX: CGFloat = UIScreen.main.bounds.width / 2 - 50
                    let startY: CGFloat = UIScreen.main.bounds.height / 2 - 150

                    path.move(to: CGPoint(x: startX, y: startY))
                    path.addLine(to: CGPoint(x: startX + 50, y: startY + 50))
                    path.addLine(to: CGPoint(x: startX, y: startY + 100))
                    path.addLine(to: CGPoint(x: startX + 50, y: startY + 150))
                    path.addLine(to: CGPoint(x: startX, y: startY + 200))
                    path.addLine(to: CGPoint(x: startX + 50, y: startY + 250))
                }
                .stroke(Color.blue, lineWidth: 5)
                .frame(width: 300, height: 300)

                Spacer()
            }

            // Back Button in the top-left corner
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
