//
//  BackButton.swift
//  DoItNow
//
//  Created by Arnold Therigan on 26/07/25.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button(action: { dismiss() }) {
            Image(IMAGE_WORDING.backIC)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .foregroundColor(.white)
                .padding()
                .background(Color(hex: COLORS_CODE.blue))
                .frame(width: 36, height: 36)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CustomBackButton()
}
