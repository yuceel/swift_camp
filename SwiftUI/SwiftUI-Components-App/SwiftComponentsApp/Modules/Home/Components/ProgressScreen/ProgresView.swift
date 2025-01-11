import SwiftUI
import Combine

struct ProgresView: View {
    @ObservedObject var presenter: ProgressPresenter
    @State private var linearProgressValue: Double = 0
    @State private var circularProgressValue: Double = 0
    @State private var lastTapDate: Date = Date()
    private let minValue: Double = 0
    private let maxValue: Double = 100
    private let backButtonIcon: String = "chevron.left"
    let increasedValue: Double = 10
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
            
            Spacer()
            Text("Circular Progress bars with different labels")
                .padding(.all, 10)
            
            HStack{
                ProgressView{
                    Text("indeterminate")
                        .font(.headline)
                        .foregroundStyle(Color.red)
                }
                Spacer()
                // circular icon can be changed with any icon
                ProgressView{
                    Image(systemName: "swift")
                }
            }.padding(.horizontal, 75)
            
            
            
            Spacer()
            // a linear progress bar to show progress how much completed
            
            ProgressView("determinate", value: linearProgressValue, total: maxValue)
                .progressViewStyle(.linear)
                .padding(.horizontal, 10)
                .frame(width: 300, height: 10)
            
            Text("Click here to complete linear progress bar")
                .padding()
                .background(Color.purple)
                .cornerRadius(10)
                .padding(.horizontal)
                .onTapGesture {
                    lastTapDate = Date()
                    if(linearProgressValue < maxValue && linearProgressValue >= minValue){
                        linearProgressValue = linearProgressValue + increasedValue
                    }
                    
                }
                .onAppear{
                    startTimer()
                }
            // for iOS circular progress does not support to determinate, it only supports macOS
            ProgressView("circular determinate only works on macOS", value: circularProgressValue, total: maxValue)
                .progressViewStyle(.circular)
            Spacer()
        }
    }
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let currentTime = Date()
            let decreasedValue: Double = 5
            if currentTime.timeIntervalSince(lastTapDate) >= 0.2 {
                if linearProgressValue > minValue {
                    linearProgressValue = linearProgressValue - decreasedValue
                }
            }
        }
    }
        
}

