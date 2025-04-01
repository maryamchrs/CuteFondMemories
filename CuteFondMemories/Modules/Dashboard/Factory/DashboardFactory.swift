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

final class DashboardFactory: DashboardFactoryProtocol {
    
    init(dependencies: DependencyContainerProtocol) {
        self.dependencies = dependencies
        self.logger = dependencies.logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    private(set) var dependencies: DependencyContainerProtocol
    private(set) var logger: DefaultLoggerProtocol
}

extension DashboardFactory {
    @MainActor func makeDashboardViewController() -> DashboardViewController {
        let viewController = DashboardViewController()
        let presenter = DashboardPresenter()
        let worker = DashboardWorker()
        let interactor = DashboardInteractor(presenter: presenter,
                                             worker: worker,
                                             locationService: dependencies.makeLocationService())
        
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
