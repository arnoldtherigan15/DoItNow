//
//  Register.swift
//  DoItNow
//
//  Created by Arnold Therigan on 26/07/25.
//

import SwiftUI

struct RegisterRequest: Codable {
    let username: String
    let email: String
    let password: String
}

struct RegisterModel: Codable {
    let userName: String
    let email: String
    let password: String
    let confirmPassword: String
}

struct RegisterResponse: Codable {
    let id: Int?
    let token: String?
    let error: String?
}

struct VerifyRequest: Encodable {
    let code: String
}

struct VerifyResponse: Decodable {
    let success: Bool
    let message: String
}

