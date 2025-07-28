//
//  InputField.swift
//  DoItNow
//
//  Created by Arnold Therigan on 26/07/25.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct InputField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 20) {
                Image(icon)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.blue)
                    .clipShape(RoundedCorner(radius: 8, corners: [.topLeft, .bottomLeft]))

                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.2)))

            if let error = errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}
