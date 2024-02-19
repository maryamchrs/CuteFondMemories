//
//  DashboardInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import UIKit

protocol DashboardBusinessLogic {
    func viewDidLoad(request: Dashboard.ViewDidLoad.Request)
    func oneLocationSelected(request: Dashboard.AddingAnnotaion.Request)
}

protocol DashboardDataStore {}

final class DashboardInteractor: DashboardDataStore {
    // MARK: - Object lifecycle
    init() {
        DashboardLogger.logInit(owner: String(describing: DashboardInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        DashboardLogger.logDeinit(owner: String(describing: DashboardInteractor.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var presenter: DashboardPresentationLogic?
    var worker: DashboardWorkerLogic?
}

// MARK: - Methods
// MARK: Public
extension DashboardInteractor {}

// MARK: Private
private extension DashboardInteractor {}
// MARK: - Business Logics
extension DashboardInteractor: DashboardBusinessLogic {
    
    func viewDidLoad(request: Dashboard.ViewDidLoad.Request) {
        Task {
            let response = Dashboard.DisplayLocation.Response(latitude: 51.50735,
                                                              longitude: -0.12776,
                                                              latitudinalMeters: 1500,
                                                              longitudinalMeters: 1500,
                                                              withAnimation: true)
            await presenter?.presentCameraOnLocation(response: response)
            
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
