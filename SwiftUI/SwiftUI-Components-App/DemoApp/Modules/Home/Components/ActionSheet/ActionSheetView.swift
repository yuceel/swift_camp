import SwiftUI

struct ActionSheetView: View {
    @ObservedObject var presenter: ActionSheetPresenter
    @State private var showActionSheet = false // ActionSheet görünürlüğünü kontrol eder

    var body: some View {
        ZStack {
            VStack {
                Text("Dynamic ActionSheet Example")
                    .font(.headline)
                    .padding()

                Spacer()

                Button(action: {
                    showActionSheet.toggle()
                }) {
                    Text("Show ActionSheet")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(
                        title: Text("Choose an Action"),
                        message: Text("Please select one of the following options:"),
                        buttons: [
                            .default(Text("Option 1")) {
                                print("Option 1 selected")
                            },
                            .default(Text("Option 2")) {
                                print("Option 2 selected")
                            },
                            .destructive(Text("Delete")) {
                                print("Delete selected")
                            },
                            .cancel()
                        ]
                    )
                }

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
            .padding() // Adds padding to position button
        }
    }
}

