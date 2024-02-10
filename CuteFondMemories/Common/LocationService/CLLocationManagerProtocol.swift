//
//  CLLocationManagerProtocol.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 10/02/2024.
//

import Foundation
import CoreLocation

protocol CLLocationManagerProtocol {
    var delegate: CLLocationManagerDelegate? { get set }
    
    func requestLocation()
    func stopUpdatingLocation()
}

extension CLLocationManager: CLLocationManagerProtocol {}
