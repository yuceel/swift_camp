import SwiftUI

struct TransactionView: View {

    @ObservedObject var presenter: TransactionPresenter

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

            // Animatable Circle
            Circle()
                .fill(Color.blue)
                .frame(width: presenter.isExpanded ? 200 : 100,
                       height: presenter.isExpanded ? 200 : 100)
                .shadow(radius: 5)

            // Toggle Button
            Button("Toggle Expansion") {
                presenter.toggleExpansion()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
    }
}
