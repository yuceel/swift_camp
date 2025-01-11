//
//  StepperView.swift
//  DemoApp
//
//  Created by Büşra Gedikoğlu on 29.12.2024.
//

import SwiftUI

struct StepperView: View {
    @ObservedObject var presenter: StepperPresenter

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
                   
                   Text("Select Quantity")
                       .font(.headline)

                   Stepper(value: $presenter.quantity, in: 0...10, step: 1) {
                       Text("Quantity: \(presenter.quantity)")
                           .font(.subheadline)
                           .foregroundColor(presenter.quantity == 0 ? .red : .primary)
                   }
                   .padding()
                   .background(Color.gray.opacity(0.2))
                   .cornerRadius(10)
                   .padding(.horizontal)

                   if presenter.quantity > 0 {
                       Text("You selected \(presenter.quantity) items.")
                           .font(.body)
                           .foregroundColor(.green)
                   } else {
                       Text("Please select at least 1 item.")
                           .font(.body)
                           .foregroundColor(.red)
                   }
                   
                   Spacer()
               }
               .padding()
           }
       }
