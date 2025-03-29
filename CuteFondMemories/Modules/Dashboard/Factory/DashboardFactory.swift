//
//  DashboardFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 11/02/2024.
//

import Foundation

protocol DashboardFactoryProtocol {
    @MainActor func makeDashboardViewController() -> DashboardViewController
}

final class DashboardFactory: DependencyContainer, DashboardFactoryProtocol, Loggable {
    
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init()
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    private(set) var logger: DefaultLoggerProtocol
}

extension DashboardFactory {
    @MainActor func makeDashboardViewController() -> DashboardViewController {
        let viewController = DashboardViewController()
        let presenter = DashboardPresenter()
        let worker = DashboardWorker()
        let interactor = DashboardInteractor(presenter: presenter,
                                             worker: worker,
                                             locationService: makeLocationService())
        
        let router = DashboardRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        router.factory = self
        return viewController
    }
}
