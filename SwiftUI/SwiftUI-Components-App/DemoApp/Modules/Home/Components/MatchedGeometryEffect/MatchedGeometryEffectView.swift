import SwiftUI

struct MatchedGeometryEffectView: View {

    @ObservedObject var presenter: MatchedGeometryEffectPresenter
    @Namespace private var animationNamespace

    var body: some View {
        VStack(spacing: 20) {
            // Go back button
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            // MatchedGeometryEffect
            VStack {
                if presenter.isExpanded {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "rectangle", in: animationNamespace)
                        .frame(width: 300, height: 200)
                        .onTapGesture {
                            presenter.toggleView()
                        }
                } else {
                    Circle()
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "rectangle", in: animationNamespace)
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            presenter.toggleView()
                        }
                }
            }
            .animation(.spring(), value: presenter.isExpanded)

            Spacer()
        }
        .padding()
    }
}
