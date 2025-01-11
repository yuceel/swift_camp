import SwiftUI

struct LazyVStackView: View {
    @ObservedObject var presenter: LazyVStackPresenter
    let items = Array(1...100)  //100 elements

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

               //LazyVStack
               ScrollView {
                   LazyVStack {
                       ForEach(items, id: \.self) { item in
                           Text("Item \(item)")
                               .padding()
                               .frame(maxWidth: .infinity)
                               .background(Color.blue)
                               .cornerRadius(8)
                               .foregroundColor(.white)
                               .padding(.horizontal)
                       }
                   }
               }
           }
       }
   }
