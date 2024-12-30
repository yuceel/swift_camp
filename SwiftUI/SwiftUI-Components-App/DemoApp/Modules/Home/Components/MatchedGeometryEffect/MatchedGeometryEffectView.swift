import SwiftUI

struct MatchedGeometryEffectView: View {

    @ObservedObject var presenter: MatchedGeometryEffectPresenter
    @Namespace private var animationNamespace

    var body: some View {
        VStack(spacing: 30) {
            // Header Section
            HStack {
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }

                Spacer()

                Text("Matched Geometry Effect")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)

            Spacer()

            // Animation Section
            VStack(spacing: 30) {
                Text("Tap to Animate")
                    .font(.headline)
                    .foregroundColor(.primary)

                ZStack {
                    if presenter.isExpanded {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.blue)
                            .matchedGeometryEffect(id: "rectangle", in: animationNamespace)
                            .frame(width: 300, height: 200)
                            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                            .onTapGesture {
                                presenter.toggleView()
                            }
                    } else {
                        Circle()
                            .fill(Color.blue)
                            .matchedGeometryEffect(id: "rectangle", in: animationNamespace)
                            .frame(width: 100, height: 100)
                            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                            .onTapGesture {
                                presenter.toggleView()
                            }
                    }
                }
                .animation(.spring(response: 0.5, dampingFraction: 0.6), value: presenter.isExpanded)
            }

            Spacer()

            // Instruction Section
            VStack(spacing: 10) {
                Text(presenter.isExpanded ? "State: Expanded" : "State: Collapsed")
                    .font(.headline)
                    .foregroundColor(.primary)

                Text("Tap the shape to toggle its state.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .background(Color(UIColor.systemBackground)) 
        .edgesIgnoringSafeArea(.bottom)
        .padding()
    }
}
