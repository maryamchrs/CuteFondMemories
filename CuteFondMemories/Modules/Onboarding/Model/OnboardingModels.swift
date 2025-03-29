//
//  OnboardingModels.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

enum Onboarding {
    
    enum ViewDidLoad {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum ShowDescription {
        struct Request {
        }
        struct Response {
            let description: String
        }
        struct ViewModel {
            let mutableAttributedString: NSMutableAttributedString
        }
    }
    
}
