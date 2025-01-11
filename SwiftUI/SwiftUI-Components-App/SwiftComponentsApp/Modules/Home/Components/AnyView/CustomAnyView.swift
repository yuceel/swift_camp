import SwiftUI

struct CustomAnyView: View {
    @ObservedObject var presenter: AnyViewPresenter

    var body: some View {
        VStack(spacing: 20) {
            //Go back button
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            views[presenter.currentViewIndex]
                .frame(maxWidth: .infinity, maxHeight: 200)
                .shadow(radius: 5)
            
            Button("Change View") {
                // Change view
                presenter.currentViewIndex = (presenter.currentViewIndex + 1) % views.count
            }
            .font(.headline)
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
    
    // A list containing different views
    private let views: [AnyView] = [
        AnyView(
            VStack {
                Text("Red View")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Circle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
            }
            .padding()
            .background(Color.red.opacity(0.2))
            .cornerRadius(20)
        ),
        AnyView(
            VStack {
                Text("Green View")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green)
                    .frame(width: 120, height: 80)
            }
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(20)
        ),
        AnyView(
            VStack {
                Text("Blue View")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Capsule()
                    .fill(Color.blue)
                    .frame(width: 150, height: 50)
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(20)
        )
    ]
}
