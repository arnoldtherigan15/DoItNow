//
//  RegisterView.swift
//  DoItNow
//
//  Created by Arnold Therigan on 25/07/25.
//

import SwiftUI

enum RegisterRoute: Hashable {
    case verify
    case login
}

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @State private var route: RegisterRoute?
    @State private var errorMessage: String?

    var body: some View {
        NavigationStack {
            VStack {
                HStack { CustomBackButton(); Spacer() }
                Spacer().frame(height: 16)

                VStack(spacing: 4) {
                    Text(GENERAL_WORDING.appTitle)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.blue)
                    Text("Management App")
                        .foregroundColor(.gray)

                    Text("Create your account")
                        .padding(.top, 40)
                }

                VStack(spacing: 12) {
                    InputField(icon: "person", placeholder: "Username", text: $viewModel.userName, errorMessage: viewModel.userNameError)
                    InputField(icon: "mail", placeholder: "Email", text: $viewModel.email, errorMessage: viewModel.emailError)
                    InputField(icon: "lock", placeholder: "Password", text: $viewModel.password, isSecure: true, errorMessage: viewModel.passwordError)
                    InputField(icon: "lock", placeholder: "Confirm Password", text: $viewModel.confirmPassword, isSecure: true, errorMessage: viewModel.confirmPasswordError)
                }
                .padding(.vertical)

                Spacer()
                VStack(spacing: 12) {
                    Button("Register") {
                        viewModel.register(
                            onSuccess: { route = .verify },
                            onFailure: { error in
                                errorMessage = error
                            }
                        )
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.isRegisterButtonEnabled ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(!viewModel.isRegisterButtonEnabled)

                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .font(.footnote)
                            .foregroundColor(.gray)

                        Button(action: { route = .login }) {
                            Text("Login here")
                                .font(.footnote)
                                .foregroundColor(.blue)
                                .underline()
                        }
                    }
                }
            }
            .padding()
            .navigationDestination(item: $route) { route in
                switch route {
                case .verify:
                    VerifyView()
                case .login:
                    VerifyView()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
