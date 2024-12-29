import SwiftUI

struct LongPressGestureView: View {
    @State private var isPressed = false
    @State private var holdDurationMessage = "Hold to see duration"
    @State private var combinedMessage = "Long press or double tap"
    @State private var isCircleScaled = false
    @State private var rotationAngle: Double = 0
    @State private var dragOffset = CGSize.zero
    
    @ObservedObject var presenter : LongPressGesturePresenter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Example 1: Simple Long Press
                VStack {
                    Text("Simple Long Press")
                        .font(.headline)
                    Text("Long press the button for 1 second to toggle its state.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(isPressed ? "Pressed!" : "Long Press Me")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .background(isPressed ? Color.green : Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .onTapGesture {
                            isPressed = false
                        }
                        .gesture(
                            LongPressGesture(minimumDuration: 1.0)
                                .onEnded { _ in
                                    isPressed.toggle()
                                }
                        )
                }
                
                // Example 2: Long Press with Hold Duration Feedback
                VStack {
                    Text("Long Press with Hold Duration Feedback")
                        .font(.headline)
                    Text("Hold for 2 seconds to see feedback messages.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(holdDurationMessage)
                        .font(.headline)
                        .padding()
                        .background(Color.orange.opacity(0.8))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .gesture(
                            LongPressGesture(minimumDuration: 2.0)
                                .onChanged { _ in
                                    holdDurationMessage = "Keep holding..."
                                }
                                .onEnded { _ in
                                    holdDurationMessage = "Hold complete!"
                                }
                        )
                }
                
                // Example 3: Combining Long Press and Other Gestures
                VStack {
                    Text("Combining Long Press and Other Gestures")
                        .font(.headline)
                    Text("Long press to see one message, or double tap to see another.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(combinedMessage)
                        .font(.headline)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .gesture(
                            LongPressGesture(minimumDuration: 1.0)
                                .onEnded { _ in
                                    combinedMessage = "Long Press Detected!"
                                }
                                .simultaneously(with: TapGesture(count: 2)
                                    .onEnded {
                                        combinedMessage = "Double Tap Detected!"
                                    }
                                )
                        )
                }
                
                // Example 4: Scaling an Object
                VStack {
                    Text("Scaling an Object")
                        .font(.headline)
                    Text("Long press the circle for 1.5 seconds to scale it.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                        .scaleEffect(isCircleScaled ? 1.5 : 1.0)
                        .animation(.easeInOut, value: isCircleScaled)
                        .gesture(
                            LongPressGesture(minimumDuration: 1.5)
                                .onEnded { _ in
                                    isCircleScaled.toggle()
                                }
                        )
                }
                
                // Example 5: Rotating an Object
                VStack {
                    Text("Rotating an Object")
                        .font(.headline)
                    Text("Long press the rectangle for 1 second to rotate it.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(rotationAngle))
                        .gesture(
                            LongPressGesture(minimumDuration: 1.0)
                                .onEnded { _ in
                                    withAnimation(.spring()) {
                                        rotationAngle += 45
                                    }
                                }
                        )
                }
                
                // Example 6: Dragging and Long Press
                VStack {
                    Text("Dragging and Long Press")
                        .font(.headline)
                    Text("Drag the rectangle to move it. Long press to reset its position.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: 200, height: 100)
                        .offset(dragOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    dragOffset = value.translation
                                }
                                .simultaneously(with: LongPressGesture(minimumDuration: 1.0)
                                    .onEnded { _ in
                                        dragOffset = .zero
                                    }
                                )
                        )
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Long Press Gesture Examples")
        }
    }
}
