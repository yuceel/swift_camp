

import SwiftUI

struct GeometryReaderView: View {

    @ObservedObject var presenter: GeometryReaderPresenter
    let backButtonIcon: String = "chevron.left"
    
    
    var body: some View {
        VStack(spacing: 30) {
            
        // back button to navigate home view
            Button(action: presenter.goBack) {
                Image(systemName: backButtonIcon)
                    .font(.title2)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Circle())
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
         VStack(spacing: 20) {
                Text("GeometryReader")
                    .font(.largeTitle)
                    .bold()
                    .padding()
        
            GeometryReader { geometry in
                VStack {
               //Width of parent view's in geometry Reader
                    Text("Parent View Width")
                        .font(.headline)
                    Text("\(Int(geometry.size.width)) pixel")
                        .font(.title)
                        .bold()
                //Height of parent view's in geometry Reader

                    Text("Parent View Height")
                        .font(.headline)
                    Text("\(Int(geometry.size.height)) pixel")
                        .font(.title)
                        .bold()
                                
                    Text("Something about on the mid")
                        .padding()
                        .foregroundColor(.black)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 4) // set the text on mid's horizontally and top-quarter vertically
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.gray.opacity(0.2))
                        .border(.black, width: 2)

                        }
                        .frame(height: 300) // constant height for geometry readere component

                        
                        GeometryReaderInnerView() //
                        .frame(height: 200)
                    }
                    .padding()
                }
            }

    struct GeometryReaderInnerView: View {
                var body: some View {
                    GeometryReader { geometry in
                        HStack(spacing: 0) {
                            Text("Left")
                                .frame(width: floor(geometry.size.width / 3)) // divide three equally size for each component
                                .background(Color.red)
                                .foregroundColor(.white)
                                .font(.title)
                            
                            
                            Text("Center")
                                .frame(width: floor(geometry.size.width / 3))
                                .background(Color.green)
                                .foregroundColor(.white)
                                .font(.title)
                            
                            
                                                        
                            Text("Right")
                                .frame(width: floor(geometry.size.width / 3))
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                    .border(.black, width: 2)
                }
            }
        }
    

