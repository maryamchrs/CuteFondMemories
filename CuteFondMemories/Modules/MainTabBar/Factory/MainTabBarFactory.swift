//
//  MainTabBarFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import Foundation

protocol MainTabBarFactoryProtocol {
    func makeMainTabBarViewController() -> MainTabBarViewController
}

protocol MainTabBarServiceFactory {
    func makeMainTabBarService() -> MainTabBarService
}

class MainTabBarFactory {
 @MainActor func makeMainTabBarViewController() -> MainTabBarViewController {
        let viewController = MainTabBarViewController()
        let interactor = MainTabBarInteractor()
        let presenter = MainTabBarPresenter()
        let router = MainTabBarRouter()
        let worker = MainTabBarWorker(service: makeMainTabBarService())
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

func makeMainTabBarService() -> MainTabBarService {
return MainTabBarService(httpClient: URLSession.shared)
}
}