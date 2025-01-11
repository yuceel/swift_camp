import SwiftUI

struct PickerView: View {
    @ObservedObject var presenter: PickerPresenter
    @State private var selectedOption = 0
    
    var body: some View {
        VStack(spacing: 30) {
            // Back button
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
            
            Text("Select an Option")
                .font(.title)
                .padding(10)
            
            // Segmented Style Picker
            Picker("Options", selection: $selectedOption) {
                Text("Option 1").tag(0)
                Text("Option 2").tag(1)
                Text("Option 3").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(10)
            
            // Wheel Style Picker
            Picker("Select an option", selection: $selectedOption) {
                Text("Option 1").tag(0)
                Text("Option 2").tag(1)
                Text("Option 3").tag(2)
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 100)
            .padding(10)
            
            // Menu Style Picker
            Picker("Menu", selection: $selectedOption) {
                Text("Option 1").tag(0)
                Text("Option 2").tag(1)
                Text("Option 3").tag(2)
            }
            .pickerStyle(MenuPickerStyle())
            .padding(10)
            
            Text("Selected Option: \(selectedOption + 1)")
                .foregroundColor(.blue)
                .padding(10)
            
            Spacer()
        }
        .padding(10)
    }
}
