import SwiftUI

struct GridRowView: View {
    @ObservedObject var presenter: GridRowPresenter
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 30) {
                VStack(alignment: .leading, spacing: 30) {
                    if #available(iOS 16.0, *) {
                        ForEach(0..<items.count / 2, id: \.self) { rowIndex in
                            GridRow {
                                ForEach(0..<2, id: \.self) { columnIndex in
                                    let itemIndex = rowIndex * 2 + columnIndex
                                    if itemIndex < items.count {
                                        CardView(title: items[itemIndex])
                                    }
                                }
                            }
                        }
                    } else {
                        ForEach(0..<items.count / 2, id: \.self) { rowIndex in
                            HStack(spacing: 20) {
                                ForEach(0..<2, id: \.self) { columnIndex in
                                    let itemIndex = rowIndex * 2 + columnIndex
                                    if itemIndex < items.count {
                                        CardView(title: items[itemIndex])
                                    }
                                }
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    Button(action: {
                        presenter.goBack()
                    }) {
                        Text("Go Back")
                            .font(.headline)
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct CardView: View {
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
        }
        .frame(width: 100, height: 100)
        .background(LinearGradient(
            gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ))
        .foregroundColor(.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}


