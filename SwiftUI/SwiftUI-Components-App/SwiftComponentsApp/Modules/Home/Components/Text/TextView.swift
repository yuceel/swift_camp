import SwiftUI

struct TextView: View {
    
    @ObservedObject var presenter: TextPresenter
    
    var body: some View {
        VStack(spacing: 20) {
            // Geri Dön Butonu
            Button(action: presenter.goBack) {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                    Text("Back")
                        .foregroundColor(.blue)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            // Görüntülenecek Metin
            Text(presenter.displayedText)
                .font(.title)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

