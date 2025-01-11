import SwiftUI



struct CornerRadiusView: View {
    @ObservedObject var presenter: CornerRadiusPresenter
    let backButtonIcon: String = "chevron.left"
    
    
    var body: some View {
        
        VStack(spacing: 30) {
            Button(action: presenter.goBack) {
                Image(systemName: backButtonIcon)
                    .font(.title2)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Circle())
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Spacer()
        
        VStack{
            TextComponentWithRadius(text:" No Radius" , foregroundColor: Color.white, backgroundColor: .black, radius: 0)
            TextComponentWithRadius(text: "5 radius", foregroundColor: .white, backgroundColor: .red, radius: 5)
            TextComponentWithRadius(text: "20 radius", foregroundColor: .white, backgroundColor: .blue, radius: 20)
            TextComponentWithRadius(text: "45 radius", foregroundColor: .white, backgroundColor: .purple, radius: 45)
            TextComponentWithRadius(text: "50 radius", foregroundColor: .white, backgroundColor: .purple, radius: 50)

        }.padding()
        Spacer()
    }
}

func TextComponentWithRadius(text: String, foregroundColor: Color, backgroundColor: Color, radius: CGFloat) -> some View {
    let text: String = text
    let foregroundColor: Color = foregroundColor
    let backgroundColor: Color = backgroundColor
    let radius: CGFloat = radius
    
    return Text(text)
        .frame(width: 200, height: 90)
        .foregroundStyle(foregroundColor)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: radius))
}


