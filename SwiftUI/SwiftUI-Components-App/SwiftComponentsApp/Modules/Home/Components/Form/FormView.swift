import SwiftUI

struct FormView: View {
    @ObservedObject var presenter: FormPresenter
    
    @State private var name: String = ""
    @State private var isFeatureEnabled: Bool = false
    @State private var selectedOption: String = "Option 1"
    @State private var sliderValue: Double = 50
    @State private var date: Date = Date()
    
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Basic Details
                    Text("Basic Details")
                        .font(.headline)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        .frame(height: 50)
                        .overlay(
                            TextField("Enter your name", text: $name)
                                .padding(.horizontal)
                        )
                    
                    Toggle("Enable Feature", isOn: $isFeatureEnabled)
                        .padding(.horizontal)
                    
                    // Preferences
                    Text("Preferences")
                        .font(.headline)
                    
                    Picker("Select an Option", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    Slider(value: $sliderValue, in: 0...100, step: 1)
                        .padding(.horizontal)
                    
                    Text("Current Value: \(Int(sliderValue))")
                        .padding(.horizontal)
                    
                    // Date Picker
                    Text("Date Picker")
                        .font(.headline)
                    
                    DatePicker("Select a Date", selection: $date, displayedComponents: [.date])
                        .padding(.horizontal)
                    
                    // Submit Button
                    Button(action: submitForm) {
                        Text("Submit")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
        .navigationTitle("Form")
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func submitForm() {
        print("Form submitted with:")
        print("Name: \(name)")
        print("Feature Enabled: \(isFeatureEnabled)")
        print("Selected Option: \(selectedOption)")
        print("Slider Value: \(sliderValue)")
        print("Date: \(date)")
    }
}
