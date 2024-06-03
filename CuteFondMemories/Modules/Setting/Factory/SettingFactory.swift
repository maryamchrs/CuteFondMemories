//
//  SettingFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import Foundation

protocol SettingFactoryProtocol {
    func makeSettingViewController() -> SettingViewController
}

protocol SettingServiceFactory {
    func makeSettingService() -> SettingService
}

class SettingFactory: SettingFactoryProtocol {
    @MainActor func makeSettingViewController() -> SettingViewController {
        let viewController = SettingViewController()
        let interactor = SettingInteractor()
        let presenter = SettingPresenter()
        let router = SettingRouter()
        let worker = SettingWorker(service: makeSettingService())
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
    
    func makeSettingService() -> SettingService {
        return SettingService(httpClient: URLSession.shared)
    }
}
