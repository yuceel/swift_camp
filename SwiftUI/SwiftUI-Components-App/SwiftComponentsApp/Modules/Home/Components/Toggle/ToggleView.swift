import SwiftUI

struct ToggleView: View {

    @ObservedObject var presenter: TogglePresenter

    var body: some View {
        VStack(spacing: 30) {
            // Header Section
            HStack {
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }

                Spacer()
            }
            .padding(.horizontal)
            Spacer()
            
            Image(systemName: presenter.arrowDirection ? "arrow.down" : "arrow.up")
                .font(.system(size: 110, weight: .bold))

            Spacer()

            Toggle("Arrow direction", isOn: $presenter.arrowDirection)
                .padding(.horizontal,80)
            Text("Another expression for Toggle")
                .padding()

            HStack {
                Toggle(isOn: Binding(
                    get: { !presenter.arrowDirection }, // false olduğunda aktif
                    set: { presenter.arrowDirection = !$0 } // durumu tersine çevir
                )) {
                    Label("Up", systemImage: "arrow.up")
                }
                Toggle(isOn: $presenter.arrowDirection) {
                    Label("Down", systemImage: "arrow.down")
                }
            }
            .toggleStyle(.button)

            Spacer()
        }
        .background(LinearGradient(
            gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.white]),
            startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.bottom)
    }
}
