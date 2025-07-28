//
//  OTPInputView.swift
//  DoItNow
//
//  Created by Arnold Therigan on 28/07/25.
//

import SwiftUI

struct OTPInputView: View {
    @Binding var text: String
    let fieldIndex: Int
    @FocusState.Binding var focusedField: Int?
    var onTextEntered: (() -> Void)? = nil

    var body: some View {
        TextField("", text: $text)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .frame(width: 40, height: 40)
            .background(Color.clear)
            .overlay(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color.blue),
                alignment: .bottom
            )
            .focused($focusedField, equals: fieldIndex)
            .onChange(of: text) { newValue in
                if newValue.count > 1 {
                    text = String(newValue.prefix(1))
                }
                if newValue.count == 1 {
                    onTextEntered?()
                }
            }
    }
}
