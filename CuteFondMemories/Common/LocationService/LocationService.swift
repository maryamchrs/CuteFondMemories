//
//  LocationService.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 10/02/2024.
//

import Foundation
import CoreLocation
import Combine

protocol LocationServiceProtocol: AnyObject {
    var locationPublisher: (AnyPublisher<CLLocationCoordinate2D?, Never>)? { get }
    func requestLocation()
    func stopGettingLocation()
}

final class LocationService: NSObject {
    
    private(set) var manager: CLLocationManagerProtocol?
    
    private(set) var locationSubject = PassthroughSubject<CLLocationCoordinate2D?, Never>()
    var locationPublisher: (AnyPublisher<CLLocationCoordinate2D?, Never>)? {
        locationSubject.eraseToAnyPublisher()
    }
    
    init(manager: CLLocationManagerProtocol = CLLocationManager()) {
        super.init()
        setupManager(manager)
    }
}

// MARK: - Private Methods

private extension LocationService {
    func setupManager(_ manager: CLLocationManagerProtocol) {
        self.manager = manager
        self.manager?.delegate = self
        self.manager?.requestWhenInUseAuthorization()
        self.manager?.requestLocation()
    }
}

// MARK: - LocationServiceProtocol

extension LocationService: LocationServiceProtocol {
    func requestLocation() {
        manager?.startUpdatingLocation()
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
