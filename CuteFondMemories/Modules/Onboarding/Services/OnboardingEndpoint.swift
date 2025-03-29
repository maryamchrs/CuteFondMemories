//
//  OnboardingEndpoint.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import Foundation

enum OnboardingEndpoint {
    case something
}

extension OnboardingEndpoint: EndPoint {
    
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
