//
//  VerifyView.swift
//  DoItNow
//
//  Created by Arnold Therigan on 26/07/25.
//

import SwiftUI

struct VerifyView: View {
    @StateObject var viewModel = VerifyViewModel()
    @FocusState private var focusedField: Int?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    HStack { CustomBackButton(); Spacer() }
                    Spacer().frame(height: 16)
                    Text(GENERAL_WORDING.appTitle).font(.system(size: 28, weight: .bold)).foregroundColor(.blue)
                    Text("Management  App").foregroundColor(.gray)
                    Text("Verify Account").padding(.top)

                    Image(IMAGE_WORDING.verifyAccount)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .padding()

                    Text("Please enter the verification number\nwe send to your email")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .font(.footnote)

                    HStack(spacing: 12) {
                        OTPInputView(text: $viewModel.digit1, fieldIndex: 1, focusedField: $focusedField) {
                            focusedField = 2
                        }
                        OTPInputView(text: $viewModel.digit2, fieldIndex: 2, focusedField: $focusedField) {
                            focusedField = 3
                        }
                        OTPInputView(text: $viewModel.digit3, fieldIndex: 3, focusedField: $focusedField) {
                            focusedField = 4
                        }
                        OTPInputView(text: $viewModel.digit4, fieldIndex: 4, focusedField: $focusedField) {
                            focusedField = nil
                        }
                    }
                    .padding(.top)

                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(.red).font(.footnote)
                    }

                    Button("Confirm") {
                        viewModel.confirm()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                    Button("Resend") {
                        print("Resend code")
                    }
                    .foregroundColor(.blue)
                    .font(.footnote)

                    Spacer()
                }
                .padding()
                .navigationDestination(isPresented: $viewModel.isVerified) {
                    VerifySuccessView()
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}
//
//#Preview {
//    VerifyView()
//}
