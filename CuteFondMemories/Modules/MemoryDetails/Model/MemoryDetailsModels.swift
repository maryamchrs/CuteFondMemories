//
//  MemoryDetailsModels.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 13/02/2024.
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
            let selectedDate: Date
        }
        struct ViewModel {
            let selectedDate: Date
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
            let selectedImage: UIImage?
        }
        struct Response {
            let imageData: Data?
        }
        struct ViewModel {
            let selectedImage: UIImage?
        }
    }
    
    enum ImageType {
        case photos
        case cameras
        
        init?(rawValue: String) {
            if rawValue == "photos".localize {
                self = .photos
            } else if rawValue == "camera".localize  {
                self = .cameras
            } else {
                return nil
            }
        }
    }
    
    enum PickerImageSetup {
        struct Request {
            
        }
        struct Response {
            let type: ImageType
            
        }
        struct ViewModel {
            let type: ImageType
        }
    }
    
    enum ActionOnAlertView{
        struct Request {
            let action: UIAlertAction
        }
        struct Response {
            
        }
        struct ViewModel {
        }
    }
    
    struct NewMemoryDetailsInfo {
        let title: String
        let descriptionOfMemory: String
        let date: Date?
        let image: Data?
        let latitude: Double
        let longitude: Double
    }
}
