//
//  SettingEndpoint.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import Foundation

enum SettingEndpoint {
    case something
}

extension SettingEndpoint: EndPoint {
    
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
