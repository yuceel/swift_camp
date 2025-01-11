import SwiftUI

struct TimeLineView: View {
    @ObservedObject var presenter: TimeLineViewPresenter

    var body: some View {
        ZStack {
            // Main content
            VStack {
                Text("Timeline")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                TimelineView(PeriodicTimelineSchedule(from: Date(), by: 1)) { context in
                    VStack(spacing: 10) {
                        Text("\(context.date, formatter: dateFormatter)")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()

                        Circle()
                            .fill(Color.blue)
                            .frame(width: 20, height: 20)

                        Text("An Event at \(context.date, formatter: dateFormatter)")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                }
                .padding()
            }

            // Back Button positioned at the top-left corner
            VStack {
                HStack {
                    Button(action: presenter.goBack) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                    Spacer() // Push the content away horizontally
                }
                Spacer() // Push the content away vertically
            }
            .padding() // Add padding to avoid touching the screen edges
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
}

