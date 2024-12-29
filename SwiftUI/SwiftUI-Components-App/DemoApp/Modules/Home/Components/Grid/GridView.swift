import SwiftUI

struct GridView: View {

    @ObservedObject var presenter: GridPresenter

    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100), spacing: 15)
    ]

    var body: some View {
        VStack(spacing: 20) {
            // Header Section
            HStack {
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }

                Spacer()

                Text("Dynamic Grid View")
                    .font(.headline)
                    .bold()
            }
            .padding(.horizontal)

            Spacer()

            // Grid Section
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(presenter.items, id: \.self) { item in
                        VStack {
                            Circle()
                                .fill(Color.blue.opacity(0.3))
                                .frame(width: 60, height: 60)

                            Text(item)
                                .font(.caption)
                                .foregroundColor(.blue)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .background(Color(UIColor.systemGroupedBackground))
        .edgesIgnoringSafeArea(.bottom)
    }
}
