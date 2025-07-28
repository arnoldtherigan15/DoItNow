//
//  RegisterViewModel.swift
//  DoItNow
//
//  Created by Arnold Therigan on 25/07/25.
//
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var userName = "" { didSet { validateUserName() } }
    @Published var email = "" { didSet { validateEmail() } }
    @Published var password = "" { didSet { validatePassword() } }
    @Published var confirmPassword = "" { didSet { validateConfirmPassword() } }

    @Published var userNameError: String?
    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var confirmPasswordError: String?

    @Published var isRegisterButtonEnabled = true

    let service: AuthServiceProtocol

    init(service: AuthServiceProtocol = RegisterService()) {
        self.service = service
    }

    private func validateUserName() {
        if userName.isEmpty {
            userNameError = "Username is required"
        } else {
            userNameError = nil
        }
        validateForm()
    }

    private func validateEmail() {
        if email.isEmpty {
            emailError = "Email is required"
        } else if !email.contains("@") {
            emailError = "Email is not valid"
        } else {
            emailError = nil
        }
        validateForm()
    }

    private func validatePassword() {
        if password.isEmpty {
            passwordError = "Password is required"
        } else {
            passwordError = nil
        }
        validateForm()
    }

    private func validateConfirmPassword() {
        if confirmPassword.isEmpty {
            confirmPasswordError = "Confirmation is required"
        } else if confirmPassword != password {
            confirmPasswordError = "Passwords do not match"
        } else {
            confirmPasswordError = nil
        }
        validateForm()
    }

    private func validateForm() {
        isRegisterButtonEnabled =
            userNameError == nil &&
            emailError == nil &&
            passwordError == nil &&
            confirmPasswordError == nil &&
            !userName.isEmpty &&
            !email.isEmpty &&
            !password.isEmpty &&
            !confirmPassword.isEmpty
    }

    func register(onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void) {
        validateUserName()
        validateEmail()
        validatePassword()
        validateConfirmPassword()

        guard isRegisterButtonEnabled else { return }

        let request = RegisterRequest(username: userName, email: email, password: password)

        service.register(request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    onSuccess()
                case .failure(let error):
                    onSuccess()
                }
            }
        }
    }
}
