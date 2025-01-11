import SwiftUI

// Enum to represent colors
enum ColorOption: String, CaseIterable {
    case red = "Red"
    case green = "Green"
    case blue = "Blue"
    case yellow = "Yellow"
    
    var color: Color {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        }
    }
}

struct SegmentedControlView: View {
    @State private var selectedSegment = 0
    @State private var selectedColor: ColorOption = .red
    @ObservedObject var presenter: SegmentedControlPresenter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Back Button
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                // 1. Simple Segmented Control (Picker)
                Picker("Select a Segment", selection: $selectedSegment) {
                    Text("First").tag(0)
                    Text("Second").tag(1)
                    Text("Third").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // 2. Display selected segment
                Text("You selected: \(selectedSegment == 0 ? "First" : selectedSegment == 1 ? "Second" : "Third")")
                    .font(.title)
                    .padding()
                
                // 3. Segmented Control with Custom Label (Color Picker)
                Picker("Select Color", selection: $selectedColor) {
                    ForEach(ColorOption.allCases, id: \.self) { color in
                        Text(color.rawValue).tag(color)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // 4. Display selected color
                Text("You selected: \(selectedColor.rawValue)")
                    .font(.title)
                    .padding()
                    .foregroundColor(selectedColor.color) // Display the color dynamically
                
                // 5. Disabled Segmented Control
                Picker("Disabled Segmented Control", selection: $selectedSegment) {
                    Text("Option 1").tag(0)
                    Text("Option 2").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .disabled(true)
                .padding()
                
                // 6. Dynamic Segmented Control (Color Picker)
                Text("Dynamic Segmented Control (\(selectedColor.rawValue) Color)") // Updated text to reflect selected color
                    .font(.title2)
                    .padding()
                
                Picker("Select Color", selection: $selectedColor) {
                    ForEach(ColorOption.allCases, id: \.self) { color in
                        Text(color.rawValue).tag(color)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
            }
            .padding()
        }
    }
}
