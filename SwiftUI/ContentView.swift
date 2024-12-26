//
// ContentView.swift
// SwiftUIExample
//
// Created by Mehmet Albayrak on 27/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding()
            
            Text("This is a simple text component example.")
                .font(.body)
                .foregroundColor(.gray)
        }
    }
}

// Preview Provider for SwiftUI Canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
