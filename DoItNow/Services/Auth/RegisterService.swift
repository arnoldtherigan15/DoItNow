//
//  RegisterService.swift
//  DoItNow
//
//  Created by Arnold Therigan on 28/07/25.
//

import SwiftUI
import Alamofire

protocol AuthServiceProtocol {
    func register(_ request: RegisterRequest, completion: @escaping (Result<RegisterResponse, Error>) -> Void)
    func verify(_ request: VerifyRequest, completion: @escaping (Result<VerifyResponse, Error>) -> Void)
}

class RegisterService : AuthServiceProtocol {
    func register(_ request: RegisterRequest, completion: @escaping (Result<RegisterResponse, Error>) -> Void) {
        let url = URL_WORDING.register
        let headers: HTTPHeaders = ["x-api-key": "reqres-free-v1"]

        AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: headers)
            .validate()
            .responseDecodable(of: RegisterResponse.self) { response in
                switch response.result {
                case .success(let data):
                    if let error = data.error {
                        completion(.failure(NSError(domain: error, code: 400)))
                    } else {
                        completion(.success(data))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    func verify(_ request: VerifyRequest, completion: @escaping (Result<VerifyResponse, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if request.code == "1234" {
                completion(.success(VerifyResponse(success: true, message: "Verified")))
            } else {
                completion(.failure(NSError(domain: "InvalidCode", code: 401)))
            }
        }
    }
}
