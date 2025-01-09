import SwiftUI

struct GroupBoxView: View {
    
    @ObservedObject var presenter: GroupBoxPresenter
    @State private var userAgreed: Bool = false
    @State private var isLiked: Bool = false // Butonun durumunu takip eden state
    
    var body: some View {
        VStack {
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            GroupBox(label:
                        Label(presenter.title, systemImage: "building.columns")
            ) {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack {
                        // Doğru görsel adını kullanarak resmi ekliyoruz
                        Image("anitkabir_image")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200) // Görsel yüksekliği
                            .padding(.bottom, 10) // Alttan biraz boşluk ekleyin
                        
                        Text(presenter.description)
                            .font(.footnote)
                            .multilineTextAlignment(.center) // Daha iyi hizalama
                    }
                }
                .frame(height: 300)
                Button(action: {
                    isLiked.toggle()
                }) {
                    Image(systemName: "heart.fill")
                        .font(.title2)
                        .foregroundColor(isLiked ? .pink : .gray)
                        .padding()
                        .background(isLiked ? Color.pink.opacity(0.3) : Color.gray.opacity(0.2))
                        .clipShape(Circle())
                        .padding()
                }

            }
            
            Spacer()
        }
    }
}
