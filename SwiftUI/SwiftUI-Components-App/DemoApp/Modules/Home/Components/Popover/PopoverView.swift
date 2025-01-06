import SwiftUI

struct PopoverView: View {
    @ObservedObject var presenter: PopoverPresenter
    @State private var showPopover = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Back button with consistent style
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
            
            Spacer()
            
            Text("Popover Demo")
                .font(.title)
                .padding()
            
            Button("Show Popover") {
                showPopover = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .popover(isPresented: $showPopover) {
                VStack(spacing: 15) {
                    Text("Popover Content")
                        .font(.headline)
                        .padding()
                    
                    Text("This is a popover example")
                        .font(.body)
                        .padding()
                    
                    Button("Dismiss") {
                        showPopover = false
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}