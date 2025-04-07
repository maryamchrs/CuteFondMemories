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

final class DashboardFactory: DashboardFactoryProtocol, Loggable {
    
    // MARK: - Life Cycle
    init(dependencies: DependencyContainerProtocol) {
        self.dependencies = dependencies
        self.logger = dependencies.logger
        logInit()
    }

    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    private(set) var dependencies: DependencyContainerProtocol
    private(set) var logger: DefaultLoggerProtocol
    private(set) weak var interactor: DashboardBusinessLogic?
    private(set) weak var presenter: DashboardPresentationLogic?
    private(set) weak var worker: DashboardWorkerLogic?
    private(set) weak var router: DashboardRoutingLogic?
}

extension DashboardFactory {
    @MainActor func makeDashboardViewController() -> DashboardViewController {
        let viewController = DashboardViewController()
        let interactor = getInteractor()
        let presenter = getPresenter()
        _ = getWorker()
        let router = getRouter()
        
        configure(
            viewController: viewController,
            interactor: interactor,
            presenter: presenter,
            router: router
        )
        
        return viewController
    }
}

// MARK: - Private Methods
private extension DashboardFactory {
    func getInteractor() -> DashboardBusinessLogic {
        guard let interactor = self.interactor else {
            let interactor = DashboardInteractor(
                presenter: getPresenter(),
                worker: getWorker(),
                locationService: dependencies.makeLocationService()
            )
            self.interactor = interactor
            return interactor
        }
        return interactor
    }
    
    func getPresenter() -> DashboardPresentationLogic {
        guard let presenter = self.presenter else {
            let presenter = DashboardPresenter()
            self.presenter = presenter
            return presenter
        }
        return presenter
    }
    
    func getWorker() -> DashboardWorkerLogic {
        guard let worker = self.worker else {
            let worker = DashboardWorker()
            self.worker = worker
            return worker
        }
        return worker
    }
    
    func getRouter() -> DashboardRoutingLogic {
        guard let router = self.router else {
            let router = DashboardRouter()
            self.router = router
            return router
        }
        return router
    }
    
    @MainActor func configure(
           viewController: DashboardViewController,
           interactor: DashboardBusinessLogic,
           presenter: DashboardPresentationLogic,
           router: DashboardRoutingLogic
       ) {
           viewController.interactor = interactor
           viewController.router = router
           
           presenter.viewController = viewController
           
           router.viewController = viewController
           router.dataStore = interactor
           // router.factory = self
       }
}
