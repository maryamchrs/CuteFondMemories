//
//  DashboardInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import UIKit
import Combine

protocol DashboardBusinessLogic {
    func viewDidLoad(request: Dashboard.ViewDidLoad.Request)
    func oneLocationSelected(request: Dashboard.AddingAnnotaion.Request)
}

protocol DashboardDataStore {
    var locationService: LocationService? { get set }
}

final class DashboardInteractor: DashboardDataStore {
    // MARK: - Object lifecycle
    init() {
        DashboardLogger.logInit(owner: String(describing: DashboardInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        cancellable.removeAll()
        DashboardLogger.logDeinit(owner: String(describing: DashboardInteractor.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var presenter: DashboardPresentationLogic?
    var worker: DashboardWorkerLogic?
    
    var locationService: LocationService?
    private var cancellable = Set<AnyCancellable>()
}

// MARK: - Methods
// MARK: Public
extension DashboardInteractor {}

// MARK: Private
private extension DashboardInteractor {
    func addObserver() {
        locationService?.locationPublisher?
            .sink(receiveValue: { [weak self] userLocation in
                guard let self, let userLocation else { return }
                Task {
                    await self.changeCameraLocation(latitude: userLocation.latitude,
                                                    longitude: userLocation.longitude)
                    
                    self.locationService?.stopGettingLocation()
                }
            }).store(in: &cancellable)
    }
    
    func changeCameraLocation(latitude: Double, longitude: Double) async {
        let response = Dashboard.DisplayLocation.Response(latitude: Constants.LondonCLLocation2D.latitude,
                                                          longitude: Constants.LondonCLLocation2D.longitude,
                                                          latitudinalMeters: 1500,
                                                          longitudinalMeters: 1500,
                                                          withAnimation: true)
        await presenter?.presentCameraOnLocation(response: response)
    }
}
// MARK: - Business Logics
extension DashboardInteractor: DashboardBusinessLogic {
    
    func viewDidLoad(request: Dashboard.ViewDidLoad.Request) {
        Task {
            addObserver()
            locationService?.requestLocation()
//            await changeCameraLocation(latitude: 51.50735, longitude: -0.12776)
        }
    }
    
    func oneLocationSelected(request: Dashboard.AddingAnnotaion.Request) {
        Task {
//            let response = Dashboard.AddingAnnotaion.Response(selectedLocation: request.selectedLocation)
//            await presenter?.presentSelectedPlace(response: response)
            await presenter?.presentMemoryDetailsScene(response: Dashboard.MemoryDetailsScene.Response())
            
        }
    }
}
