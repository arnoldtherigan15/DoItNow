//
//  SplashScreenView.swift
//  DoItNow
//
//  Created by Arnold Therigan on 24/07/25.
//

import SwiftUI
import ArnoldKit

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            Image("splash-screen-main")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.ATHighlightBlue600))
                .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            GettingStartedView()
        }
    }
}

#Preview {
    SplashScreenView()
}
