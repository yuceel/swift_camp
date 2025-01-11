import SwiftUI

struct PaddingView: View {
    @ObservedObject var presenter: PaddingPresenter
    
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
               
               // Text with no padding
               Text("This text has no padding.")
                   .border(Color.red, width: 3)
               
               // Text with default padding
               Text("This text has default padding.")
                   .padding()
                   .border(Color.blue, width: 3)
               
               // Text with specific padding on the leading side
               Text("This text has padding only on the leading side.")
                   .padding(.leading, 50)
                   .border(Color.green, width: 3)
               
               // Text with different horizontal and vertical padding
               Text("This text has larger horizontal padding and smaller vertical padding.")
                   .padding(.horizontal, 60) // Larger horizontal padding
                   .padding(.vertical, 20)   // Smaller vertical padding
                   .border(Color.orange, width: 3)
               
               Spacer()
           }
           .padding(20) // General padding for the VStack
           .background(Color.gray.opacity(0.2)) // Background to highlight the VStack area
       }
   }
