import SwiftUI

struct BackgroundView: View {
    @ObservedObject var presenter: BackgroundPresenter
    @State private var backgroundColor: Color = .white //
    let backButtonIcon: String = "chevron.left"
    var body: some View {
        
        
            ZStack {
                backgroundColor
                VStack() {
                    Button(action: presenter.goBack) {
                        Image(systemName: backButtonIcon)
                            .font(.title2)
                            .padding()
                            .background(.blue.opacity(0.2))
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }.background(backgroundColor)
                        .padding(.top, 30)
                    Spacer()
                //a button, click on the this button changed the background color
                Button(action: {
                    backgroundColor =  Color.randomColor()}){
                        Text("Change Background Color")
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(colors: [.purple, .black], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .cornerRadius(10)
                    }
                    Spacer()
            }
            
        }.ignoresSafeArea()
        
    }
}

