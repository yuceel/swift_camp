import SwiftUI

struct TransitionView: View {
    @ObservedObject var presenter: TransitionPresenter
    @State private var isAnimating = false
    @State private var selectedTransition = 0

    var body: some View {
        VStack(spacing: 20) {
            // Back button
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)

            // Transition selector
            Picker("Select Transition", selection: $selectedTransition) {
                Text("Slide").tag(0)
                Text("Scale").tag(1)
                Text("Opacity").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // Demo content
            Button("Toggle Animation") {
                withAnimation {
                    isAnimating.toggle()
                }
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            if isAnimating {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.purple)
                    .frame(width: 200, height: 200)
                    .transition(transition(for: selectedTransition))
                    .overlay(
                        Text("Animated Content")
                            .foregroundColor(.white)
                            .font(.headline)
                    )
            }

            Spacer()
        }
        .padding()
    }

    private func transition(for index: Int) -> AnyTransition {
        switch index {
        case 0:
            return .slide
        case 1:
            return .scale
        case 2:
            return .opacity
        default:
            return .identity
        }
    }
}
