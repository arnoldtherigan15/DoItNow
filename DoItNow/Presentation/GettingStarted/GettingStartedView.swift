//
//  GettingStartedView.swift
//  DoItNow
//
//  Created by Arnold Therigan on 24/07/25.
//

import SwiftUI

struct GettingStartedView: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")  // Replace with your image
                .resizable()
                .frame(width: 200, height: 200)
                .padding()

            Text("Welcome to My App!")
                .font(.title)
                .padding()
//
//            NavigationLink(destination: RegisterView()) {
//                Text("Get Started")
//                    .font(.title2)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
        }
        .navigationTitle("Getting Started")
    }
}
