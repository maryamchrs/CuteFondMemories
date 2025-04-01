//
//  HomeFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import Foundation

protocol HomeFactoryProtocol {
    func makeHomeViewController() -> HomeViewController
}

final class HomeFactory {
    
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    private(set) var logger: DefaultLoggerProtocol
}

extension HomeFactory {
    @MainActor func makeHomeViewController() -> HomeViewController {
        let viewController = HomeViewController()
        let presenter: HomePresentationLogic = HomePresenter(viewController: viewController)
        let worker: HomeWorkerLogic = HomeWorker()
        let interactor = HomeInteractor(presenter: presenter, worker: worker)
        let router = HomeRouter()
       
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
