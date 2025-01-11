import SwiftUI

struct SectionView: View {
    
    @ObservedObject var presenter: SectionPresenter
    
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
            
            // Bölüm Listesi
            List(presenter.sections, id: \.self) { section in
                Button(action: {
                    presenter.selectSection(section)
                }) {
                    HStack {
                        Text(section)
                            .foregroundColor(presenter.selectedSection == section ? .blue : .primary)
                        Spacer()
                        if presenter.selectedSection == section {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            Spacer()
        }
        .padding()
    }
}
