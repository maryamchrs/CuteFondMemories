//
//  MemoryPreviewModels.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 08/07/2024.
//

import UIKit

enum MemoryPreview {
    
    enum ViewDidLoad {
        struct Request {
        }
        struct Response {
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
    }
    
    struct ViewModel {
        var title: String?
        var description: String?
        var date: Date?
        var image: UIImage?
        var loading: Bool = false
    }
}

