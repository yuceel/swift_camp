//
//  TapGestureView.swift
//  DemoApp
//
//  Created by Büşra Gedikoğlu on 29.12.2024.
//

import SwiftUI

struct TapGestureView: View {
    @ObservedObject var presenter: TapGesturePresenter
       
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
               
               // Single Tap Gesture
               Text(presenter.singleTapMessage)
                   .padding()
                   .background(Color.gray.opacity(0.2))
                   .cornerRadius(10)
                   .onTapGesture {
                       presenter.singleTapMessage = "You tapped once!"
                }
               
               // Double Tap Gesture
               Text(presenter.doubleTapMessage)
                   .padding()
                   .background(Color.gray.opacity(0.2))
                   .cornerRadius(10)
                   .onTapGesture(count: 2) {
                       presenter.doubleTapMessage = "You double-tapped!"
                }
               
               // Change color on tap
               RoundedRectangle(cornerRadius: 15)
                   .fill(presenter.boxColor)
                   .frame(width: 200, height: 200)
                   .onTapGesture {
                       presenter.boxColor = presenter.boxColor == .blue ? .green : .blue
                }
               
               Spacer()
               
           }
           .padding()
       }
   }
