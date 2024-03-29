//
//  DashboardFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import Foundation

protocol DashboardFactoryProtocol {
    func makeDashboardViewController() -> DashboardViewController
}

final class DashboardFactory: DependencyContainer, DashboardFactoryProtocol {
    
    @MainActor func makeDashboardViewController() -> DashboardViewController {
        let viewController = DashboardViewController()
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter()
        let router = DashboardRouter()
        let worker = DashboardWorker(service: makeDashboardService())
        let fileWorker = DashboardFileWorker(storageManager: makeStorageManager())
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        interactor.fileWorker = fileWorker
        interactor.locationService = makeLocationService()
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        router.factory = self
        return viewController
    }
    
    func makeDashboardService() -> DashboardService {
        return DashboardService(httpClient: URLSession.shared)
    }
}
