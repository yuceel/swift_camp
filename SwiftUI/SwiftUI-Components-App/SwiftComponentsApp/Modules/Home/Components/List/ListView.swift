import SwiftUI
 
struct ListView: View {
    @ObservedObject var presenter: ListPresenter
    let items = [
        ("Spider-Man", "heart.circle.fill", Color.red),
        ("Lightning McQueen", "heart.circle.fill", Color.orange),
        ("Ben Tennyson", "heart.circle.fill", Color.blue),
        ("Sherlock Holmes", "heart.circle.fill", Color.gray),
        ("Hobie Brown", "heart.circle.fill", Color.red),
        ("SpongeBob", "heart.circle.fill", Color.yellow),
        ("Super Mario", "heart.circle.fill", Color.red),
        ("Batman", "heart.circle.fill", Color.black),
        ("Simba", "heart.circle.fill", Color.orange)
    ]
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
                .frame(height: 50) // Üstte biraz boşluk
            // Başlık
            Text("Characters")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                
            HStack {
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black) // Button icon color
                        .frame(width: 44, height: 44) // Button size
                        .background(Color.white) // Background color
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) // Shadow effect
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
            List(items, id: \.0) { item in
                HStack(spacing: 15) {
                    // Icon with color
                    Image(systemName: item.1)
                        .foregroundColor(item.2)
                        .font(.largeTitle)
                    // Text and Subtitle
                    VStack(alignment: .leading, spacing: 5) {
                        Text(item.0)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("A popular character")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 8) // Adds padding around each row
            }
            
        }
        .background(Color(.systemGray6)) // Set background color to light gray
        .edgesIgnoringSafeArea(.all) // Ensure the background covers the entire screen
    }
}

