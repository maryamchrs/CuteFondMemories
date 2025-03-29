//
//  DashboardModels.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 11/02/2024.
//

import UIKit
import MapKit

enum Dashboard {
    // MARK: Use cases
    enum ViewDidLoad {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum DisplayLocation {
        struct Request {
        }
        struct Response {
            let latitude: Double
            let longitude: Double
            let latitudinalMeters: Double
            let longitudinalMeters: Double
            let withAnimation: Bool
        }
        struct ViewModel {
            let latitude: Double
            let longitude: Double
            let latitudinalMeters: Double
            let longitudinalMeters: Double
            let withAnimation: Bool
        }
    }
    
    enum AddingAnnotation {
        struct Request {
            let selectedLocation: CLLocationCoordinate2D
        }
        struct Response {
            let memories: [Memory]
        }
        struct ViewModel {
            let annotations: [CLLocationCoordinate2D]
        }
    }
    
    enum MemoryDetailsScene {
        struct Request {
        }
        struct Response {
            let memory: Memory?
            let latitude: Double
            let longitude: Double
        }
        struct ViewModel {
            let memory: Memory?
            let latitude: Double
            let longitude: Double
        }
    }
    
    enum MemoryListUpdated {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
}
