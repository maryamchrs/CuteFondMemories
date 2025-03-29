//
//  MemoryDetailsFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 13/02/2024.
//

import Foundation

protocol MemoryDetailsFactoryProtocol {
    func makeMemoryDetailsViewController() -> MemoryDetailsViewController
}

final class MemoryDetailsFactory: DependencyContainer {
    @MainActor func makeMemoryDetailsViewController(memory: Memory?,
                                                    latitude: Double,
                                                    longitude: Double) -> MemoryDetailsViewController {
        let viewController = MemoryDetailsViewController()
        let presenter = MemoryDetailsPresenter()
        let memoryUseCase = MemoryUseCase(repository: makeMemoryRepository())
        let worker = MemoryDetailsWorker(memoryUseCase: memoryUseCase)
        let interactor = MemoryDetailsInteractor(presenter: presenter,
                                                 worker: worker)
       
        let router = MemoryDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.memory = memory
        interactor.latitude = latitude
        interactor.longitude = longitude
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        router.factory = self
        
        return viewController
    }
}
