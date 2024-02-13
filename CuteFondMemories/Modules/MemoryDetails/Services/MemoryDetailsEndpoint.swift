//
//  MemoryDetailsEndpoint.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import Foundation

enum MemoryDetailsEndpoint {
    case something
}

extension MemoryDetailsEndpoint: EndPoint {
    
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
