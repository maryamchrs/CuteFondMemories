//
//  HomeEndpoint.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import Foundation

enum HomeEndpoint {
    case something
}

extension HomeEndpoint: EndPoint {
    
    var baseURL: String {
        "/"
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
