import SwiftUI

struct TextFieldView: View {
    @ObservedObject var presenter: TextFieldPresenter
    @State private var stringIntNumber: String = ""
    @State private var decimalIntNumber: String = ""
    @State private var stringAnything: String = ""
    @State private var textfieldWithIcon: String = ""
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
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Text("Number Textfields")
                    .padding()
                    .frame(maxWidth:.infinity, alignment: .leading)
          
                //Only integer numbers can be entered in this textfield
                customTextField(title: "Enter only integers", text: $stringIntNumber)
                    .keyboardType(.numberPad)
                
                customTextField(title: "Enter decimal numbers", text: $decimalIntNumber)
                    .keyboardType(.decimalPad)
                
                Text("Anything can be entered")
                    .padding()
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                customTextField(title:"Enter anything", text:$stringAnything)
                
                
                Text("Textfield with Icon")
                    .padding()
                    .frame(maxWidth:.infinity, alignment: .leading)
              
                HStack{
                    Image(systemName: "lock")
                    TextField("TextField with Icon", text: $textfieldWithIcon)
                       
                } .padding(.vertical)
                    .padding(.horizontal, 20)
                .background(Color.gray.opacity(0.5))
                    .clipShape(Capsule(style: .continuous))
       
            }
            Spacer()
        }
    }
    
    private func customTextField(title:String, text:Binding<String>) -> some View {
            let title: String = title
            @State var text: Binding<String> = text
        return TextField(title, text: text)
            .padding(.vertical)
            .padding(.horizontal, 20)
            .background(Color.gray.opacity(0.5))
            .clipShape(Capsule(style: .continuous))
    }
}
