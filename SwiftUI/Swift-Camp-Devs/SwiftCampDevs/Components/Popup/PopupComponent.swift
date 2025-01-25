import SwiftUI


struct SCPopupComponent: View {
    let title: String
    let message: String
    let actions: [PopupAction]

    var body: some View {
        ZStack {
            AppColors.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 16) {
                Text(title)
                    .font(.headline)
                    .padding()

                Text(message)
                    .font(.body)
                    .multilineTextAlignment(.center)

                HStack {
                    ForEach(actions, id: \.id) { action in
                        AppButton(
                            type: .normal,
                            size: .medium,
                            text: action.title,
                            action: action.handler
                        )
                    }
                }
            }
            .padding()
            .background(AppColors.white)
            .cornerRadius(UISizerHelper.Radius.normal)
            .shadow(radius: UISizerHelper.Radius.low)
            .padding(40)
        }
    }
}
#Preview {
    @State var showPopup = true

    var actions = [
        PopupAction(title: "Cancel", handler: { print("Cancel clicked") }),
        PopupAction(title: "Confirm", isDestructive: true, handler: { print("Confirm clicked") })
    ]
    
    if showPopup {
        SCPopupComponent(title: "Popup Title", message: "This is a message for the popup", actions: actions)
            .onTapGesture {
                showPopup.toggle()
            }
    }
}
