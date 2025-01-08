import SwiftUI

struct EnvironmentView: View {
    @ObservedObject var presenter: EnvironmentPresenter

    // Environment properties
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.locale) private var locale
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Title
                Text("Environment View Page")
                    .font(.callout)
                    .padding()

                // Color Scheme
                Text("Theme: \(colorScheme == .dark ? "Dark Mode" : "Light Mode")")
                    .font(.headline)
                    .padding()
                    .background(colorScheme == .dark ? Color.black.opacity(0.2) : Color.white.opacity(0.2))
                    .cornerRadius(10)

                // Locale
                Text("Locale: \(locale.identifier)")
                    .font(.headline)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)

                // Horizontal Size Class
                Text("Horizontal Size Class: \(horizontalSizeClass == .compact ? "Compact" : "Regular")")
                    .font(.headline)
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(10)

                // Scene Phase
                Text("Scene Phase: \(scenePhase == .active ? "Active" : scenePhase == .inactive ? "Inactive" : "Background")")
                    .font(.headline)
                    .padding()
                    .background(Color.orange.opacity(0.2))
                    .cornerRadius(10)

                Spacer()
            }

            // Back Button in the top-left corner
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Close the view
                    }) {
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
            .padding()
        }
        .padding()
        .onChange(of: scenePhase) { newPhase in
            // Handle scene phase changes
            print("Scene Phase changed to: \(newPhase)")
        }
    }
}

