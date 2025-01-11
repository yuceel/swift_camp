import SwiftUI
import Combine

struct Navigationview: View {
    @ObservedObject var presenter: NavigationPresenter
    var body: some View {
        Button(action: presenter.goBack) {
            Image(systemName: "chevron.left")
                .font(.title2)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        NavigationView {
            VStack {
                Image("NavigationView") // Replace "example_image" with your image name
                                    .resizable() // Makes the image resizable
                                    .scaledToFit() // Keeps the aspect ratio
                                    .frame(width: 300, height: 200) // Sets the size of the image
                                    
                Text("""
                    NavigationView is a SwiftUI component that provides a way to navigate between different screens. It usually comes with a navigation bar at the top and allows you to create detailed views that users can transition to, typically using NavigationLink.
                    Features:
                        •    Displays a title at the top.
                        •    Enables navigation to other views using NavigationLink.
                        •    Can be customized with toolbar for additional actions or styling.
                    """)
                .padding()
                NavigationLink(destination: DetailView()) { // Link to navigate to DetailView
                    Text("Go to Details")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Navigation View")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail Screen")
            .font(.title)
            .navigationTitle("Details")
            .toolbar { // Adding a toolbar item to the navigation bar
                ToolbarItem(placement: .navigationBarTrailing) { // Placing the item in the top-right corner
                    Button(action: {
                        print("Clicked on settings")
                    })
                    {
                        Image(systemName: "gear")
                    }
                }
        }
    }
}
