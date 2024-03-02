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
    func oneAnnotaionSelected(request: Dashboard.AddingAnnotaion.Request)
    func oneMemoryAddedSuccessfuly(request: Dashboard.MemoryListUpdated.Request)
}

protocol DashboardDataStore {}

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
    var fileWorker: DashboardFileWorker?
    
    var locationService: LocationServiceProtocol?
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
    
    func findMemoryIfExists(latitude: Double, longitude: Double) async -> Memory? {
        try? await fileWorker?.retriveMemoryBasedOnLocation(latitude: latitude,
                                                            longitude: longitude)
    }
    
    func findAllExistedMemories() async throws {
        if let memories = try await fileWorker?.fetchMemories() {
            await presenter?.presentAnnotation(response: Dashboard.AddingAnnotaion.Response(memories: memories))
        }
    }
}
// MARK: - Business Logics
extension DashboardInteractor: DashboardBusinessLogic {
    
    func viewDidLoad(request: Dashboard.ViewDidLoad.Request) {
        Task {
            addObserver()
            locationService?.requestLocation()
            try await findAllExistedMemories()
        }
    }
    
    func oneLocationSelected(request: Dashboard.AddingAnnotaion.Request) {
        Task {
            let latitude = request.selectedLocation.latitude
            let longitude = request.selectedLocation.longitude
            let memory = await findMemoryIfExists(latitude: latitude, longitude: longitude)
            let response = Dashboard.MemoryDetailsScene.Response(memory: memory,
                                                                 latitude: latitude,
                                                                 longitude: longitude)
            
            await presenter?.presentMemoryDetailsScene(response: response)
        }
    }
    
    func oneAnnotaionSelected(request: Dashboard.AddingAnnotaion.Request) {
        Task {
            let latitude = request.selectedLocation.latitude
            let longitude = request.selectedLocation.longitude
            let memory = await findMemoryIfExists(latitude: latitude, longitude: longitude)
            let response = Dashboard.MemoryDetailsScene.Response(memory: memory,
                                                                 latitude: latitude,
                                                                 longitude: longitude)
            
            await presenter?.presentMemoryDetailsScene(response: response)
        }
    }
    
    func oneMemoryAddedSuccessfuly(request: Dashboard.MemoryListUpdated.Request) {
        Task {
            try await findAllExistedMemories()
        }
    }
}
