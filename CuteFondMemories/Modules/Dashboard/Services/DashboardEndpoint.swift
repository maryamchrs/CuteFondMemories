//
//  DashboardEndpoint.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 11/02/2024.
//

import Foundation

enum DashboardEndpoint {
    case something
}

extension DashboardEndpoint: EndPoint {
    
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
