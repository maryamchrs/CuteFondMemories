//
//  MemoryDetailsFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import Foundation

protocol MemoryDetailsFactoryProtocol {
    func makeMemoryDetailsViewController() -> MemoryDetailsViewController
}

protocol MemoryDetailsServiceFactory {
    func makeMemoryDetailsService() -> MemoryDetailsService
}

final class MemoryDetailsFactory: DependencyContainer {
    @MainActor func makeMemoryDetailsViewController(memory: Memory?,
                                                    latitude: Double,
                                                    longitude: Double) -> MemoryDetailsViewController {
        let viewController = MemoryDetailsViewController()
        let interactor = MemoryDetailsInteractor()
        let presenter = MemoryDetailsPresenter()
        let router = MemoryDetailsRouter()
        let worker = MemoryDetailsWorker(service: makeMemoryDetailsService())
        let fileWorker = MemoryDetailsFileWorker(storageManager: makeStorageManager())
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        interactor.fileWorker = fileWorker
        
        interactor.memory = memory
        interactor.latitude = latitude
        interactor.longitude = longitude
        
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        router.factory = self
        
        return viewController
    }
    
    func makeMemoryDetailsService() -> MemoryDetailsService {
        return MemoryDetailsService(httpClient: URLSession.shared)
    }
}
