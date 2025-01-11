import SwiftUI

struct TextFieldView: View {
    @ObservedObject var presenter: TextFieldPresenter
    @State private var stringIntNumber: String = ""
    @State private var decimalIntNumber: String = ""
    @State private var stringAnything: String = ""
    @State private var textfieldWithIcon: String = ""
    let backButtonIcon: String = "chevron.left"
    
    var body: some View {
        VStack() {
            Button(action: presenter.goBack) {
                
                Image(systemName: backButtonIcon)
                    .font(.title2)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Text("Only numbers can be entered in this text field")
                    .padding(.all, 10)
                    .frame(maxWidth:.infinity, alignment: .leading)
          
                //Only integer numbers can be entered in this textfield
                customTextField(title: "Enter only integers", text: $stringIntNumber)
                    .keyboardType(.numberPad)
                
                customTextField(title: "Enter decimal numbers", text: $decimalIntNumber)
                    .keyboardType(.decimalPad)
                
                Text("Anything can be entered in this text field")
                    .padding(.all, 10)
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                customTextField(title:"Enter anything", text:$stringAnything)
                
                Text("Textfields with Icon")
                    .padding(.all, 10)
                    .frame(maxWidth:.infinity, alignment: .leading)
              
                HStack{
                    Image(systemName: "lock")
                    TextField("TextField with Lock Icon", text: $textfieldWithIcon)
                       
                }.padding()
                    .padding(.horizontal, 10)
                .background(Color.gray.opacity(0.5))
                    .clipShape(Capsule(style: .continuous))
                
                HStack{
                   TextField("TextField with Search Icon", text: $textfieldWithIcon)
                    Image(systemName: "magnifyingglass")
                } .padding(.vertical)
                    .padding(.horizontal, 10)
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
