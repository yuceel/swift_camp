
import SwiftUI

struct DragGestureView: View {
    @ObservedObject var presenter: DragGesturePresenter
    @State private var dragOffset: CGSize = .zero

    var body: some View {
        ZStack {
            // Blue circle centered
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .offset(dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            dragOffset = value.translation
                        }
                        .onEnded { _ in
                            dragOffset = .zero
                        }
                )

            // Back Button in the top-left corner
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
