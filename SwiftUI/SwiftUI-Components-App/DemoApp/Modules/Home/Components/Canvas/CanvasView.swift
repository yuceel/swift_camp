import SwiftUI

struct CanvasView: View {

    @ObservedObject var presenter: CanvasPresenter

    // Enum for different shapes
    enum ShapeType: String, CaseIterable, Identifiable {
        case circle = "Circle"
        case rectangle = "Rectangle"
        case ellipse = "Ellipse"
        case capsule = "Capsule"

        var id: String { rawValue }
    }

    @State private var selectedShape: ShapeType = .circle

    var body: some View {
        // Scrollable view to accommodate content dynamically
        ScrollView {
            VStack(spacing: 30) {
                // Header section with a back button and title
                VStack(spacing: 10) {
                    // Go back button
                    HStack {
                        Button(action: presenter.goBack) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)

                    // Title and description
                    Text("Canvas Playground")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    Text("Experiment with shapes and colors dynamically.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()

                // Canvas section to draw shapes
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.secondary.opacity(0.1)) // Adjusted fill for better visibility in dark mode
                        .frame(height: 300)
                        .shadow(color: Color.primary.opacity(0.2), radius: 5) // Subtle shadow for better contrast
                        .overlay(
                            Canvas { context, size in
                                let shapePath: Path
                                // Determine the shape to draw based on selection
                                switch selectedShape {
                                case .circle:
                                    shapePath = Path(ellipseIn: CGRect(x: size.width / 3, y: size.height / 4, width: size.width / 3, height: size.width / 3))
                                case .rectangle:
                                    shapePath = Path(CGRect(x: size.width / 4, y: size.height / 4, width: size.width / 2, height: size.height / 2))
                                case .ellipse:
                                    shapePath = Path(ellipseIn: CGRect(x: size.width / 4, y: size.height / 4, width: size.width / 2, height: size.height / 3))
                                case .capsule:
                                    shapePath = Path(CGRect(x: size.width / 4, y: size.height / 3, width: size.width / 2, height: size.height / 4))
                                }

                                // Fill the selected shape with the chosen color
                                context.fill(shapePath, with: .color(presenter.color))

                                // Add a title for the shape
                                context.draw(Text(selectedShape.rawValue)
                                                .font(.headline)
                                                .foregroundColor(.primary),
                                             at: CGPoint(x: size.width / 2, y: size.height / 8))
                            }
                        )

                    // Placeholder text for the canvas area
                    Text("Interactive Drawing Area")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 320)
                }

                // Shape picker and color customization
                VStack(spacing: 20) {
                    // Shape picker section
                    Text("Choose a Shape")
                        .font(.headline)
                        .foregroundColor(.primary)

                    Picker("Select Shape", selection: $selectedShape) {
                        ForEach(ShapeType.allCases) { shape in
                            Text(shape.rawValue).tag(shape)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    // Color picker section
                    Text("Customize Shape Color")
                        .font(.headline)
                        .foregroundColor(.primary)

                    ColorPicker("Select a Color", selection: $presenter.color)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                }
                .padding()
            }
        }
        .background(Color(UIColor.systemBackground)) // Dynamic background for light and dark mode
        .edgesIgnoringSafeArea(.bottom)
    }
}
