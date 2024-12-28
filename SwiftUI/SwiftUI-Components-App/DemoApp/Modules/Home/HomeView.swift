import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    Text("Welcome to SwiftUI Components App")
                        .bold()
                        .padding(.bottom, 10)
                    
                    Text("Go to Detail View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    // Button to navigate to VStackView
                    Button("Go to VStackView") {
                        presenter.showVStack()
                    } .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    // Button to navigate to HStackView
                    Button("Go to HStackView") {
                        presenter.showHStack()
                    } .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)

                    
                    // Button to navigate to ZStackView
                    Button("Go to ZStackView") {
                        presenter.showZStack()
                    } .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    // Button to navigate to ContentView
                    Button("Go to ContentView") {
                        presenter.showContentView()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    // Button to navigate to ColorPicker
                    Button("Go to ColorPicker") {
                        presenter.showColorPicker()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    // New Button to navigate to RectangleView
                    Button("Go to Rectangle") {
                        presenter.showRectangle()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}
