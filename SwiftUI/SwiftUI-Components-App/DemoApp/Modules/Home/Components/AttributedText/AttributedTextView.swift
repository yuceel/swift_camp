import SwiftUI

struct AttributedTextView: View {
    @ObservedObject var presenter: AttributedTextPresenter
    var body: some View {
        VStack(spacing: 20) {
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
            // Simple styled text
            Text("Hello, ")
                .font(.title)
                .foregroundColor(.blue)
            + Text("SwiftUI!")
                .font(.title)
                .bold()
                .foregroundColor(.red)

            // Different fonts and styles
            Text("This is ")
                .font(.body)
                .foregroundColor(.black)
            + Text("italic")
                .italic()
                .font(.body)
                .foregroundColor(.purple)
            + Text(" and ")
                .font(.body)
                .foregroundColor(.black)
            + Text("bold.")
                .bold()
                .font(.body)
                .foregroundColor(.green)

            // Underlined and strikethrough text
            Text("Underlined Text")
                .underline()
                .font(.headline)
                .foregroundColor(.orange)

            Text("Strikethrough Text")
                .strikethrough()
                .font(.headline)
                .foregroundColor(.gray)

            // Multiline and alignment
            Text("This is an example of a very long text that shows how you can align and format multiple lines of text in SwiftUI.")
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()

            // Line spacing settings
            Text("Line Spacing Example")
                .lineSpacing(10)
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

            // Different sizes and color combinations
            VStack {
                Text("Large Title")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Text("Title")
                    .font(.title)
                    .foregroundColor(.green)
                Text("Body")
                    .font(.body)
                    .foregroundColor(.red)
                Spacer()
            }
        }
        .padding()
    }
}
