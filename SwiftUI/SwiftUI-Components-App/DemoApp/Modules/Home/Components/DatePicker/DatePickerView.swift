import SwiftUI

struct DatePickerView: View {
    @State private var selectedDate = Date()
    @State private var isDatePickerDisabled = false
    @State private var minDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
    @State private var maxDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())!
    @ObservedObject var presenter : DatePickerPresenter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
                
                // 1. Simple DatePicker
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .padding()
                    .datePickerStyle(WheelDatePickerStyle())
                
                // 2. DatePicker with Time
                DatePicker("Select Date and Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                    .padding()
                    .datePickerStyle(CompactDatePickerStyle())
                
                // 3. DatePicker with Date Range (Min & Max Dates)
                DatePicker("Select Date (Range)", selection: $selectedDate, in: minDate...maxDate, displayedComponents: .date)
                    .padding()
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // 4. DatePicker with Disabled State
                DatePicker("Select Date (Disabled)", selection: $selectedDate, displayedComponents: .date)
                    .padding()
                    .disabled(isDatePickerDisabled)
                    .datePickerStyle(WheelDatePickerStyle())
                
                // 5. Custom Date Format (Date Formatting)
                Text("Selected Date: \(formattedDate(selectedDate))")
                    .padding()
                
                // 6. Toggle to enable/disable DatePicker
                Toggle("Enable DatePicker", isOn: $isDatePickerDisabled)
                    .padding()
            }
            .padding()
        }
    }
    
    // Helper function for formatting the date
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
