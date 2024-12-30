import SwiftUI

struct DividerView: View {
    @ObservedObject var presenter: DividerPresenter
    
        var body: some View {
            VStack(spacing: 20) {
                //Go back button
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text("Above the Divider")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                // Default Divider
                Divider()
                
                Text("Below the Divider")
                    .font(.headline)
                    .foregroundColor(.green)
                
                // Custom Divider with color, thickness, and padding
                Divider()
                    .frame(height: 2) // Thickness of the divider
                    .background(Color.red) // Color of the divider
                    .padding(.horizontal, 30) // Add horizontal padding
                
                Text("Another Section")
                    .font(.headline)
                    .foregroundColor(.purple)
                
                Spacer()
            }
            .padding()
        }
    }
