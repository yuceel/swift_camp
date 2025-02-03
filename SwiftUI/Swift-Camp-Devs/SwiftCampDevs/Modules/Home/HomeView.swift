import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to your new app.")
                    .font(.largeTitle)
                    .padding()

                Button(action: {
                    presenter.navigateToLogin()
                }) {
                    Text("Go to Login")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
            }
        }
    }
}
