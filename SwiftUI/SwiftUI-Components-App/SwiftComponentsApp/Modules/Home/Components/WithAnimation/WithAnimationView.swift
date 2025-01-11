//
//  WithAnimationView.swift
//  DemoApp
//
//  Created by Büşra Gedikoğlu on 29.12.2024.
//

import SwiftUI

struct WithAnimationView: View {
    @ObservedObject var presenter: WithAnimationPresenter
        
        var body: some View {
            VStack(spacing: 20) {
                //Go back button
                Button(action: presenter.goBack) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text("Tap the button to toggle animation")
                    .font(.headline)
                
                // A rectangle that changes size with animation
                RoundedRectangle(cornerRadius: 20)
                    .fill(presenter.isExpanded ? Color.blue : Color.green)
                    .frame(width: presenter.isExpanded ? 300 : 100, height: presenter.isExpanded ? 200 : 100)
                    .shadow(radius: presenter.isExpanded ? 10 : 2)
                    .animation(.easeInOut, value: presenter.isExpanded)
                
                // Button to toggle the state
                Button(action: {
                    withAnimation {
                        presenter.isExpanded.toggle()
                    }
                }) {
                    Text(presenter.isExpanded ? "Shrink" : "Expand")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(presenter.isExpanded ? Color.red : Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
