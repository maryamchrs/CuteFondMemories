//
//  Constants.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 09/02/2024.
//

import Foundation

enum Constants {
    
    // TODO: Move it into Build Configs
    static let baseUrl: String = ""
    
    enum LondonCLLocation2D {
        case latitude
        case longitude
        
        var `default`: Double {
            switch self {
            case .latitude:
                51.50735
            case .longitude:
                -0.12776
            }
        }
    }
}
