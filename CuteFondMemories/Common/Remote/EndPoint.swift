//
//  EndPoint.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation

protocol EndPoint {
    var path: String { get }
    
    var httpMethod: HTTPMethod { get }
    
    var httpHeaders: [String: String]? { get }
    
    var allHeaders: [String: String] { get }
        
    var httpBody: Encodable? { get }
}

extension EndPoint {
    var allHeaders: [String: String] {
        defaultHeaders.merging(httpHeaders ?? [:]) { (_, new) in new }
    }
    
    private var defaultHeaders: [String: String] {
        ["Content-Type": "application/json",
         "Accept": "application/json"]
    }
    
    var urlRequest: URLRequest? {
        guard let url = URL(string: Constants.baseUrl + path) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        if let body = httpBody {
            let jsonData = try? encoder.encode(body)
            urlRequest.httpBody = jsonData
        }
        allHeaders.forEach({
            urlRequest.addValue($1, forHTTPHeaderField: $0)
        })
        return urlRequest
    }
}
