import SwiftUI

struct GroupView: View {
    @ObservedObject var presenter: GroupPresenter
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Go back button
            Button(action: presenter.goBack) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Car Models")
                .font(.largeTitle)
                .bold()
            
            Group {
                HStack {
                    Image(systemName: "car.fill")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text("Porsche 911 GT3 RS")
                            .font(.headline)
                        Text("High-performance sports car.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    Image(systemName: "car.2.fill")
                        .foregroundColor(.orange)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text("Ferrari 488")
                            .font(.headline)
                        Text("Italian supercar with a V8 engine.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    Image(systemName: "car.side.fill")
                        .foregroundColor(.green)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text("McLaren P1")
                            .font(.headline)
                        Text("Hybrid hypercar with electric power.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    Image(systemName: "car.rear.fill")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text("BMW X5")
                            .font(.headline)
                        Text("Luxury SUV with premium features.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                                
                HStack {
                    Image(systemName: "car.2.fill")
                        .foregroundColor(.yellow)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text("Ford Mustang Shelby GT500")
                            .font(.headline)
                        Text("American muscle car with a V8 engine.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    Image(systemName: "car.2.fill")
                        .foregroundColor(.indigo)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text("Camaro ZL1")
                            .font(.headline)
                        Text("High-performance version of the Camaro.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    Image(systemName: "car.fill")
                        .foregroundColor(.teal)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text("Dodge Challenger")
                            .font(.headline)
                        Text("Classic American muscle car.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
}
