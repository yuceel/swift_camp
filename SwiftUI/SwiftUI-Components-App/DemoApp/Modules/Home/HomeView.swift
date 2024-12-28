import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    // Button model
    struct ButtonModel: Identifiable {
        let id = UUID()
        let title: String
        let action: () -> Void
    }
    
    // Retrieve firmware information dynamically
    var deviceInfo: String {
        let systemName = UIDevice.current.systemName // e.g., "iOS"
        let systemVersion = UIDevice.current.systemVersion // e.g., "16.2"
        return "\(systemName) \(systemVersion)"
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // AppBar with dynamic firmware info
                HStack {
                    Text("Version: 1.0.0 | Firmware: \(deviceInfo)")
                        .font(.footnote)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
       
                
                ScrollView {
                    VStack(alignment: .center, spacing: 20) {
                        
                        // Centered Header
                        Text("Welcome to SwiftUI Components App")
                            .font(.title)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5)
                        
                        // Description
                        Text("This app provides an interactive guide to learning SwiftUI components. Explore, experiment, and enhance your skills through dynamic examples.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
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
                        .padding(.horizontal)
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
                            .frame(maxWidth: .infinity) // Make buttons wide
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal) // Add horizontal padding
                        }
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}
