import SwiftUI

struct CustomShapeView: View, MyCustomShapeViewProtocol {
    var presenter: CustomShapePresenter?
    @Environment(\.presentationMode) var presentationMode // Environment variable for navigating back

    var body: some View {
        VStack {
            // Go Back Button
            HStack {
                Button(action: {
                    goBack() // Trigger the go-back action
                }) {
                    Image(systemName: "arrow.left.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                }
                .padding()

                Spacer()
            }

            Spacer()
            
            // Custom Shapes in Grid
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    // First Custom Shape
                    CustomShape()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)

                    // Second Custom Shape
                    CustomShape()
                        .fill(Color.red)
                        .frame(width: 120, height: 120)
                }

                HStack(spacing: 20) {
                    // Third Custom Shape
                    CustomShape()
                        .fill(Color.green)
                        .frame(width: 120, height: 120)

                    // Fourth Custom Shape
                    CustomShape()
                        .fill(Color.orange)
                        .frame(width: 120, height: 120)
                }
            }
            .onAppear {
                presenter?.viewDidLoad()
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Custom Shape", displayMode: .inline)
    }

    func displayShape() {
        // Actions to display the shape can be implemented here
    }

    func goBack() {
        // Navigate back
        presentationMode.wrappedValue.dismiss()
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
