import SwiftUI

struct LazyHGridView: View {
    @ObservedObject var presenter: LazyHGridPresenter
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: columns, spacing: 20) {
                ForEach(items, id: \..self) { item in
                    Text(item)
                        .frame(width: 80, height: 80)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button("Go Back") {
                    presenter.goBack()
                }
            }
            .padding()
        }
    }
}


