//
//  VerifyViewModel.swift
//  DoItNow
//
//  Created by Arnold Therigan on 26/07/25.
//
import SwiftUI

protocol VerifyViewModelInput {
    func confirm(onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void)
}

protocol VerifyViewModelOutput {
    var isVerified: Bool { get }
    var digit1: String { get }
    var digit2: String { get }
    var digit3: String { get }
    var digit4: String { get }
    var errorMessage: String { get }
}

protocol VerifyViewModelInterface: VerifyViewModelInput, VerifyViewModelOutput {}

class VerifyViewModel: ObservableObject {
    @Published var digit1 = ""
    @Published var digit2 = ""
    @Published var digit3 = ""
    @Published var digit4 = ""
    @Published var isVerified = false
    @Published var errorMessage = ""

    let service: AuthServiceProtocol
    
    var code: String {
        digit1 + digit2 + digit3 + digit4
    }

    init(service: AuthServiceProtocol = RegisterService()) {
        self.service = service
    }

    func confirm() {
        guard !code.isEmpty else {
            errorMessage = "Verification code is required"
            return
        }

        let request = VerifyRequest(code: code)
        service.verify(request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.isVerified = true
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
