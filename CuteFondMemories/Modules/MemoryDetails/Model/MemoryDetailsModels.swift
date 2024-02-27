//
//  MemoryDetailsModels.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit
import Combine

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
            let title: String?
            let description: String?
            let date: Date?
            let image: UIImage?
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
    
    enum DatePicker {
        struct Request {
            let selectedDate: Date
        }
        struct Response {
            
        }
        struct ViewModel {
        }
    }
    
    enum PrefilledData {
        struct Request {
        }
        struct Response {
            let title: String?
            let description: String?
            let date: Date?
            let image: UIImage?
        }
        struct ViewModel {
            let title: String?
            let description: String?
            let date: Date?
            let image: UIImage?
        }
    }
    
    enum ActionWasSuccessful {
        struct Request {
            let selectedDate: Date
        }
        struct Response {
            
        }
        struct ViewModel {
        }
    }
    
    enum ChosenImage {
        struct Request {
            let originalImage: UIImage?
            let editedImage: UIImage?
        }
        struct Response {
            let imageData: Data?
        }
        struct ViewModel {
            let selectedImage: UIImage?
        }
    }
}
