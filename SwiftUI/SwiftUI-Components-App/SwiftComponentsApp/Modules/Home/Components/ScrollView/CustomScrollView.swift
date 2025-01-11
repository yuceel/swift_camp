import SwiftUI

struct CustomScrollView: View {
    @ObservedObject var presenter: ScrollViewPresenter
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
            
            //Horizontal ScrollView
            Text("Horizontal ScrollView")
            VStack(spacing: 20) {
                ScrollView(presenter.scrollAxisHorizontal, showsIndicators: presenter.showsIndicator) {
                    HStack(spacing: 20) {
                        ForEach(0..<10) { index in
                        Text("Item \(index)")
                                .frame(width: 100, height: 100)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            //Vertical ScrollView
            Text("Vertical ScrollView")
            VStack(spacing: 20) {
                ScrollView(presenter.scrollAxisVertical, showsIndicators: presenter.showsIndicator) {
                    VStack(spacing: 20) {
                        ForEach(0..<10) { index in
                        Text("Item \(index)")
                                .frame(width: 100, height: 100)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
}
