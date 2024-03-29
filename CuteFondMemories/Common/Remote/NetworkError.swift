//
//  NetworkError.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation

enum NetworkError: Error {
    case noData
    case unableToDecode
    case URLSessionError(String)
    case networkConnectionError
    case serverErrror
    case outDated
    case unauthorized
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noData:
            return "No Data"
        case .unableToDecode:
            return "Unable To Decode"
        case .URLSessionError(let model):
            return model
        case .networkConnectionError:
            return "some problem occured in connection"
        case .serverErrror:
            return "some problem occured in server"
        case .outDated:
            return "out dated"
        case .unauthorized:
            return "User is not authorized"
        }
    }
}
