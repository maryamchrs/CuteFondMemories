//
//  DashboardModels.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import UIKit
import MapKit

enum Dashboard {
    // MARK: Use cases
    
    enum AddingAnnotaion {
        struct Request {
            let selectedLocation: CLLocationCoordinate2D
        }
        struct Response {
            let selectedLocation: CLLocationCoordinate2D
        }
        struct ViewModel {
            let annotaions: [CLLocationCoordinate2D]
        }
    }
}
