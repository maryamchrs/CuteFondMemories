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

class MemoryDetailsFactory {
 @MainActor func makeMemoryDetailsViewController() -> MemoryDetailsViewController {
        let viewController = MemoryDetailsViewController()
        let interactor = MemoryDetailsInteractor()
        let presenter = MemoryDetailsPresenter()
        let router = MemoryDetailsRouter()
        let worker = MemoryDetailsWorker(service: makeMemoryDetailsService())
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
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