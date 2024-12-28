import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    // Button model
    struct ButtonModel: Identifiable {
        let id = UUID()
        let title: String
        let action: () -> Void
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Header
                    Text("Welcome to SwiftUI Components App")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 5)
                    
                    // Description
                    Text("This app provides an interactive guide to learning SwiftUI components. Explore, experiment, and enhance your skills through dynamic examples.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    // Benefits list
                    VStack(alignment: .leading, spacing: 10) {
                        Text("What you'll gain:")
                            .font(.headline)
                            .padding(.bottom, 5)
                        
                        // List items
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Understand core SwiftUI concepts.")
                        }
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Learn how to build interactive UIs.")
                        }
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Develop a strong foundation for app design.")
                        }
                    }
                    .padding(.bottom, 20)
                    
                    // List of button models
                    let buttons = [
                        ButtonModel(title: "Go to VStackView", action: { presenter.showVStack() }),
                        ButtonModel(title: "Go to HStackView", action: { presenter.showHStack() }),
                        ButtonModel(title: "Go to ZStackView", action: { presenter.showZStack() }),
                        ButtonModel(title: "Go to ContentView", action: { presenter.showContentView() }),
                        ButtonModel(title: "Go to ColorPicker", action: { presenter.showColorPicker() }),
                        ButtonModel(title: "Go to Rectangle", action: { presenter.showRectangle() })
                    ]
                    
                    // Using ForEach to create buttons
                    ForEach(buttons) { button in
                        Button(button.title) {
                            button.action()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}
