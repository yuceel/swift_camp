//
//  GroupView.swift
//  DemoApp
//
//  Created by 🎀 Elif 🎀 on 30.12.2024.
//

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

               
                    Text("Hero Profiles")
                        .font(.largeTitle)
                        .bold()
                    
                    Group {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.red)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text("Spider-Man")
                                    .font(.headline)
                                Text("Friendly Neighborhood Hero")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        HStack {
                            Image(systemName: "car.fill")
                                .foregroundColor(.orange)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text("Lightning McQueen")
                                    .font(.headline)
                                Text("Speed Champion")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        HStack {
                            Image(systemName: "globe.americas.fill")
                                .foregroundColor(.green)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text("Ben Tennyson")
                                    .font(.headline)
                                Text("Protector of the Omnitrix")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
              
        Spacer()
    }
}
