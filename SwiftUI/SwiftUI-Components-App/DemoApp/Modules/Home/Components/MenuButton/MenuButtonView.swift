import SwiftUI

struct MenuButtonView: View {
    @State private var isMenuOpen = false
    @ObservedObject var presenter: MenuButtonPresenter
    
    var body: some View {
        VStack {
            Button(action: {
                isMenuOpen.toggle()
            }) {
                Text("Open Menu")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            if isMenuOpen {
                VStack {
                    Button(action: {
                        print("Option 1 selected")
                        isMenuOpen = false
                    }) {
                        Text("Option 1")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        print("Option 2 selected")
                        isMenuOpen = false
                    }) {
                        Text("Option 2")
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        print("Option 3 selected")
                        isMenuOpen = false
                    }) {
                        Text("Option 3")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .transition(.slide)
            }
            Button("Go Back") {
                                presenter.goBack()
                            }
        }
        .padding()
    }
}
