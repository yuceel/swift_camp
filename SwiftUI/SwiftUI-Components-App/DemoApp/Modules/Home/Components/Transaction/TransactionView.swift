import SwiftUI

struct TransactionView: View {

    @ObservedObject var presenter: TransactionPresenter

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

                    Text("Transaction Playground")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)

                Spacer()
                // Animated Circle Section
                VStack(spacing: 20) {
                    Text("Dynamic Shape Animation")
                        .font(.headline)
                        .foregroundColor(.primary)

                    ZStack {
                        Circle()
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.cyan]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: presenter.isExpanded ? 220 : 120,
                                   height: presenter.isExpanded ? 220 : 120)
                            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)

                        Text(presenter.isExpanded ? "Expanded" : "Collapsed")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .animation(.spring(response: 0.5, dampingFraction: 0.6), value: presenter.isExpanded)
                }

                // Toggle Button Section
                Button(action: presenter.toggleExpansion) {
                    HStack {
                        Image(systemName: presenter.isExpanded ? "arrow.down" : "arrow.up")
                            .font(.headline)
                        Text(presenter.isExpanded ? "Collapse" : "Expand")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.cyan]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.blue.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .background(Color(UIColor.systemBackground)) // Dynamic background for light/dark mode
        .edgesIgnoringSafeArea(.bottom)
    }
}
