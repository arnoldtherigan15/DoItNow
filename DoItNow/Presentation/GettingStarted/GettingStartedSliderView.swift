//
//  GettingStartedSliderView.swift
//  DoItNow
//
//  Created by Arnold Therigan on 25/07/25.
//

import SwiftUI

struct GettingStartedSliderView: View {
    let slides: [SlideModel]
    @Binding var currentIndex: Int
    let onSkip: () -> Void

    var body: some View {
        VStack {
            HStack {
                HStack(spacing: 8) {
                    ForEach(0..<slides.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentIndex ? Color.blue : Color.gray.opacity(0.3))
                            .frame(width: 10, height: 10)
                    }
                }

                Spacer()
                Button(GETTING_STARTED_WORDING.skipLabel) {
                    onSkip()
                }
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.blue)
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
            
            TabView(selection: $currentIndex) {
                ForEach(Array(slides.enumerated()), id: \.offset) { index, slide in
                    VStack(spacing: 20) {
                        Image(slide.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)

                        Text(slide.title)
                            .font(.title)
                            .bold()

                        Text(slide.description)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
        }
    }
}
