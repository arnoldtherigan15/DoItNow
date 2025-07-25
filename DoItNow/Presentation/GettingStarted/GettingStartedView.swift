//
//  GettingStartedView.swift
//  DoItNow
//
//  Created by Arnold Therigan on 24/07/25.
//

import SwiftUI

enum GettingStartedRoute: Hashable {
    case register
}

struct GettingStartedView: View {
    @ObservedObject var viewModel = GettingStartedViewModel()
    @State private var route: GettingStartedRoute?

    var body: some View {
        NavigationStack {
            VStack {
                GettingStartedSliderView(
                    slides: viewModel.slides,
                    currentIndex: $viewModel.currentIndex,
                    onSkip: { route = .register }
                )

                Button(action: {
                    route = .register
                }) {
                    Text(GETTING_STARTED_WORDING.getStartedLabel)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                }
                .padding(.bottom, 40)
            }
            .navigationDestination(item: $route) { route in
                switch route {
                case .register:
                    RegisterView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
