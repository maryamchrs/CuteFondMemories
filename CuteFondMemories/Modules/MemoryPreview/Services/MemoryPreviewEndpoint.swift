//
//  MemoryPreviewEndpoint.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 08/07/2024.
//

import Foundation

enum MemoryPreviewEndpoint {
    case something
}

extension MemoryPreviewEndpoint: EndPoint {
    
    var baseURL: String {
        ""
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
