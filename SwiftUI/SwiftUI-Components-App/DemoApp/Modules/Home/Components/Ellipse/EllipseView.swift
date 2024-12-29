import SwiftUI

struct EllipseView: View {
    @ObservedObject var presenter: EllipsePresenter
    
    var body: some View {
        VStack(spacing: 20) {
            //Go back button
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Text("Customize the Ellipse")
                .font(.headline)
            Ellipse()
                .fill(presenter.color)
                .frame(width: presenter.width, height: presenter.height)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                .padding()
            
            Text("Width: \(Int(presenter.width))")
            Slider(value: $presenter.width, in: 50...300, step: 10)
                .padding()
            
            Text("Height: \(Int(presenter.height))")
            Slider(value: $presenter.height, in: 50...200, step: 10)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}
