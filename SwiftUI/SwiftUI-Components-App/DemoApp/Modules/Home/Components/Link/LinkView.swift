import SwiftUI

struct LinkView: View {
    @ObservedObject var presenter: LinkPresenter
    @State private var fetchStatus: String = "Fetching data..." // Başlangıç durumu
    
    var body: some View {
        VStack {
            Spacer()
            
            // Title
            Text("Link Page")
                .font(.largeTitle)
                .padding(.bottom, 16)
            
            // Data status
            Text(fetchStatus)
                .foregroundColor(fetchStatus.contains("successfully") ? .green : .gray)
                .padding(.bottom, 16)
            
            // Data pull button
            Button(action: {
                fetchStatus = "Fetching data..."
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Simulated delay
                    fetchStatus = "Link data successfully fetched!"
                }
            }) {
                Text("Fetch Link Data")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .padding()
        .navigationTitle("")
        .navigationBarBackButtonHidden(false)
    }
}
