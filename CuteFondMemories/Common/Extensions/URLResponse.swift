//
//  URLResponse.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation

extension URLResponse {

    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
    
}

extension  URLRequest {
    
    func printCurlCommand() {
        if let url = self.url,
           let httpMethod = self.httpMethod {
            
            var curlCommand = "curl -X \(httpMethod) '\(url.absoluteString)'"
            
            self.allHTTPHeaderFields?.forEach { key, value in
                curlCommand += " -H '\(key): \(value)'"
            }
            
            if let httpBodyData = self.httpBody, let httpBodyString = String(data: httpBodyData, encoding: .utf8) {
                curlCommand += " -d '\(httpBodyString)'"
            }
            
            print(curlCommand)
        }
    }
    
}
