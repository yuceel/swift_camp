import SwiftUI

struct tabView: View {
    @ObservedObject var presenter: TabPresenter
    var body: some View {
        TabView {
            // First tab - Home
            NavigationView {
                VStack {
                    Text("Home")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Text("This is the home page of the app.")
                        .font(.subheadline)
                }
                .navigationTitle("Home")
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }

            // Second tab - Search
            NavigationView {
                VStack {
                    Text("Search")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Text("You can search here.")
                        .font(.subheadline)
                }
                .navigationTitle("Search")
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            // Third tab - Profile
            NavigationView {
                VStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Text("You can view your profile here.")
                        .font(.subheadline)
                }
                .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle.fill")
            }
            
            // Fourth tab - Settings
            NavigationView {
                VStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Text("You can change your app settings here.")
                        .font(.subheadline)
                }
                .navigationTitle("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
        .accentColor(.purple) // Change the color of the selected tab
    }
}
