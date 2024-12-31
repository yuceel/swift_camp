
import SwiftUI

struct OffsetView: View {
    @ObservedObject var presenter: OffsetPresenter

    @State private var offsetValue: CGSize = .zero

    var body: some View {
        ZStack {
            VStack {
                Text("Applied Offset: (x: \(Int(offsetValue.width)), y: \(Int(offsetValue.height)))")
                    .font(.subheadline)
                    .padding()

                Spacer()

                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .offset(offsetValue)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                DispatchQueue.main.asyncAfter(deadline: .now()) {
                                    offsetValue = gesture.translation
                                }
                            }
                            .onEnded { _ in
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    offsetValue = .zero // Reset to initial position
                                }
                            }
                    )

                Spacer()
            }

            VStack {
                HStack {
                    Button(action: presenter.goBack) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

