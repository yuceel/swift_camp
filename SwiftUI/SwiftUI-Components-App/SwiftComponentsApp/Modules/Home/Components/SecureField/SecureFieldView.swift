//
//  SecureFieldView.swift
//  DemoApp
//
//  Created by Büşra Gedikoğlu on 28.12.2024.
//

import SwiftUI

struct SecureFieldView: View {
    @ObservedObject var presenter: SecureFieldPresenter
    
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
            
            SecureField("Enter a password", text: $presenter.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Text("You entered: \(presenter.password)")
                .padding(.horizontal)
                .foregroundColor(.blue)
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
    }
}
