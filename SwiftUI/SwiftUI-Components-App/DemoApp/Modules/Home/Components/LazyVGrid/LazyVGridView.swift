import SwiftUI

struct LazyVGridView: View {
    @ObservedObject var presenter: LazyVGridPresenter
    var items: [Int] = Array(1...100)
    let backButtonIcon: String = "chevron.left"
    
    
    var body: some View {
        //back button
        VStack(spacing: 30) {
            Button(action: presenter.goBack) {
                Image(systemName: backButtonIcon)
                    .font(.title2)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading) // to align back button to top-left
            
        }
        //Main content
        ScrollView() {
            LazyVGrid(columns: [GridItem(), GridItem()]){
                ForEach(0 ..< items.count, id: \.self) { index in
                    Rectangle()
                        .fill(Color.randomColor())
                        .frame(height: 100)
                    
                }
            }
        }
    }
}

// extension for generate random color
extension Color {
    // static keyword allows us to use this function without creating instances.
    static func randomColor(opacity: Bool = false) -> Color {
        
        return Color(
            red:.random(in: 0...1),
            green:.random(in: 0...1),
            blue:.random(in: 0...1),
            opacity: opacity ? .random(in: 0.3...1) : 1
        )
    }
}
