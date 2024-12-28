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
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    // Button to navigate to VStackView
                    Button("Go to VStackView") {
                        presenter.showVStack()
                    }
                    // Button to navigate to HStackView
                    Button("Go to HStackView") {
                        presenter.showHStack()
                    }

                    
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
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    // New Button to navigate to RectangleView
                    Button("Go to Rectangle") {
                        presenter.showRectangle()
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}
