//
//  HomeFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import Foundation

protocol HomeFactoryProtocol {
    @MainActor func makeHomeViewController() -> HomeViewController
}

final class HomeFactory: HomeFactoryProtocol, Loggable  {
    
    // MARK: - LifeCycle
    init(dependencies: DependencyContainerProtocol) {
        self.logger = dependencies.logger
        logInit()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    private(set) var logger: DefaultLoggerProtocol
    private(set) weak var interactor: HomeBusinessLogic?
    private(set) weak var presenter: HomePresentationLogic?
    private(set) weak var worker: HomeWorkerLogic?
    private(set) weak var router: HomeRoutingLogic?
}

extension HomeFactory {
    @MainActor func makeHomeViewController() -> HomeViewController {
        let viewController = HomeViewController()
        let interactor = getInteractor()
        let presenter = getPresenter()
        let router = HomeRouter()
       
        configure(
            viewController: viewController,
            interactor: interactor,
            presenter: presenter,
            router: router
        )
        
        return viewController
    }
}

// MARK: Private
private extension HomeFactory {
    func getInteractor() -> HomeBusinessLogic {
        guard let interactor = self.interactor else {
            let interactor = HomeInteractor(presenter: getPresenter(),
                                            worker: getWorker())
            self.interactor = interactor
            return interactor
        }
        return interactor
    }
    
    func getPresenter() -> HomePresentationLogic {
        guard let presenter = self.presenter else {
            let presenter = HomePresenter()
            self.presenter = presenter
            return presenter
        }
        return presenter
    }
    
    func getWorker() -> HomeWorkerLogic {
        guard let worker = self.worker else {
            let worker = HomeWorker()
            self.worker = worker
            return worker
        }
        return worker
    }
    
    func getRouter() -> HomeRoutingLogic {
        guard let router = self.router else {
            let router = HomeRouter()
            self.router = router
            return router
        }
        return router
    }
    
    @MainActor func configure(
           viewController: HomeViewController,
           interactor: HomeBusinessLogic,
           presenter: HomePresentationLogic,
           router: HomeRoutingLogic
       ) {
           viewController.interactor = interactor
           viewController.router = router
           
           presenter.viewController = viewController
           
           router.viewController = viewController
           router.dataStore = interactor
       }
}

