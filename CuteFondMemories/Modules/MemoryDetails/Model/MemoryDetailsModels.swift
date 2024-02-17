//
//  MemoryDetailsModels.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

enum MemoryDetails {
    // MARK: Use cases
    
    enum State {
        case add
        case edit
        
        var buttonTitle: String {
            switch self {
            case .add:
                return "Save"
            case .edit:
                return "Update"
            }
        }
    }
    
    enum ViewDidLoad {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum MainButton {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum MainButtonTitle {
        struct Request {
        }
        struct Response {
            let state: State
        }
        struct ViewModel {
            let title: String
        }
    }
}
