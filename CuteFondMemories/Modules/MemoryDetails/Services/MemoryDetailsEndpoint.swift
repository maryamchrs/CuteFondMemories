//
//  MemoryDetailsEndpoint.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 13/02/2024.
//

import Foundation

enum MemoryDetailsEndpoint {
    case something
}

extension MemoryDetailsEndpoint: EndPoint {
    
    var baseURL: String {
        return ""
    }
    
    var path: String {
        "/"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var httpHeaders: [String: String]? {
        return nil
    }
    
    var httpBody: Encodable? {
        return nil
    }
}
