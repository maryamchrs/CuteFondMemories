//
//  CLLocationManagerProtocol.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 10/02/2024.
//

import Foundation
import CoreLocation

protocol CLLocationManagerProtocol {
    var delegate: CLLocationManagerDelegate? { get set }
    
    func requestLocation()
    func startUpdatingLocation()
    func stopUpdatingLocation()
    func requestWhenInUseAuthorization()
}

extension CLLocationManager: CLLocationManagerProtocol {}
