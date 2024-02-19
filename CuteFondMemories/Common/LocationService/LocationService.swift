//
//  LocationService.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 10/02/2024.
//

import Foundation
import CoreLocation
import Combine

protocol LocationServiceProtocol: AnyObject {
    var locationPublisher: AnyPublisher<CLLocationCoordinate2D?, Never> { get }
    func requestLocation()
    func stopGettingLocation()
}

final class LocationService: NSObject {
    
    private var manager: CLLocationManagerProtocol?
    
    private let locationSubject = PassthroughSubject<CLLocationCoordinate2D?, Never>()
    var locationPublisher: AnyPublisher<CLLocationCoordinate2D?, Never> {
        locationSubject.eraseToAnyPublisher()
    }
    
    init(manager: CLLocationManagerProtocol = CLLocationManager()) {
        super.init()
        self.manager = manager
        self.manager?.delegate = self
    }
}

// MARK: - Private Methods

extension LocationService {}

// MARK: - LocationServiceProtocol

extension LocationService: LocationServiceProtocol {
    func requestLocation() {
        manager?.requestLocation()
    }
    
    func stopGettingLocation() {
        manager?.stopUpdatingLocation()
    }
}

// MARK: - CLLocationManagerDelegate

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last?.coordinate
        locationSubject.send(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationSubject.send(nil)
        manager.stopUpdatingLocation()
    }
}
