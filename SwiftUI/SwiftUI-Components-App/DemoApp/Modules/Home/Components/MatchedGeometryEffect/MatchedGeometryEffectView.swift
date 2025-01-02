import SwiftUI

struct MatchedGeometryEffectView: View {

    @ObservedObject var presenter: MatchedGeometryEffectPresenter
    @Namespace private var animationNamespace

    var body: some View {
        ScrollView {
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

                // Animation Section
                VStack(spacing: 30) {
                    Text("Tap to Animate")
                        .font(.headline)
                        .foregroundColor(.primary)

                    ZStack {
                        if presenter.isExpanded {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.cyan]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                                .matchedGeometryEffect(id: "rectangle", in: animationNamespace)
                                .frame(width: 300, height: 200)
                                .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                                .onTapGesture {
                                    presenter.toggleView()
                                }
                        } else {
                            Circle()
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                ))
                                .matchedGeometryEffect(id: "rectangle", in: animationNamespace)
                                .frame(width: 100, height: 100)
                                .shadow(color: Color.purple.opacity(0.4), radius: 10, x: 0, y: 5)
                                .onTapGesture {
                                    presenter.toggleView()
                                }
                        }
                    }
                    .animation(.spring(response: 0.5, dampingFraction: 0.6), value: presenter.isExpanded)
                }

                // Instruction Section
                VStack(spacing: 10) {
                    Text(presenter.isExpanded ? "State: Expanded" : "State: Collapsed")
                        .font(.headline)
                        .foregroundColor(presenter.isExpanded ? .blue : .purple)

                    Text("Tap the shape to toggle its state.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .background(Color(UIColor.systemBackground)) // Dynamic background for light and dark mode
        .edgesIgnoringSafeArea(.bottom)
    }
}
