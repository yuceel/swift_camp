import SwiftUI

struct LinkView: View {
    @ObservedObject var presenter: LinkPresenter
    @State private var fetchStatus: String = "Fetching data..." // Başlangıç durumu
    @State private var color: Color = .blue
    var body: some View {
        ZStack(alignment: .topLeading) { // Align content to the top-left corner
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
            
            // Back Button in the top-left corner
            VStack {
                HStack {
                    Button(action: presenter.goBack) {
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
    }
}
