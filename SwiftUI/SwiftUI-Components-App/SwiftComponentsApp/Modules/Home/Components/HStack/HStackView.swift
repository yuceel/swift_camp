//
//  HStackView.swift
//  DemoApp
//
//  Created by 🎀 Elif 🎀 on 28.12.2024.
//

import SwiftUI

struct HStackView: View {
    @ObservedObject var presenter: HStackPresenter
    var body: some View {
        HStack(spacing: 20) { 
                    Image(systemName: "star.fill") 
                        .foregroundColor(.yellow)
                        .font(.largeTitle)
                    
                    Text("Hello, SwiftUI!")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    Button(action: {
                        print("Button tapped!")
                    }) {
                        Text("Tap Me")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
            Button("Go Back") {
                              presenter.goBack()
                          }
            .background(Color.white)
                          .padding()
            
                }
                .padding()
    }
}
