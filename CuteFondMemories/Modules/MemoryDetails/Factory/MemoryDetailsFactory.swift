//
//  MemoryDetailsFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 13/02/2024.
//

import Foundation

protocol MemoryDetailsFactoryProtocol {
    @MainActor func makeMemoryDetailsViewController(memory: Memory?,
                                                    latitude: Double,
                                                    longitude: Double) -> MemoryDetailsViewController
}

final class MemoryDetailsFactory: MemoryDetailsFactoryProtocol {
    
    // MARK: - LifeCycle
    init(dependencies: DependencyContainerProtocol) {
        self.dependencies = dependencies
        self.logger = dependencies.logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    private(set) var dependencies: DependencyContainerProtocol
    private(set) var logger: DefaultLoggerProtocol
    private(set) weak var interactor: MemoryDetailsBusinessLogic?
    private(set) weak var presenter: MemoryDetailsPresentationLogic?
    private(set) weak var worker: MemoryDetailsWorkerLogic?
    private(set) weak var router: MemoryDetailsRoutingLogic?
}

extension MemoryDetailsFactory {
    @MainActor func makeMemoryDetailsViewController(memory: Memory?,
                                                    latitude: Double,
                                                    longitude: Double) -> MemoryDetailsViewController {
        let viewController = MemoryDetailsViewController()
        var interactor = getInteractor()
        let presenter = getPresenter()
        let worker = getWorker()
        let router = getRouter()
        
        interactor.memory = memory
        interactor.latitude = latitude
        interactor.longitude = longitude
        
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
private extension MemoryDetailsFactory {
    func getInteractor() -> MemoryDetailsBusinessLogic {
        guard let interactor = self.interactor else {
            let interactor = MemoryDetailsInteractor(presenter: getPresenter(),
                                            worker: getWorker())
            self.interactor = interactor
            return interactor
        }
        return interactor
    }
    
    func getPresenter() -> MemoryDetailsPresentationLogic {
        guard let presenter = self.presenter else {
            let presenter = MemoryDetailsPresenter()
            self.presenter = presenter
            return presenter
        }
        return presenter
    }
    
    func getWorker() -> MemoryDetailsWorkerLogic {
        guard let worker = self.worker else {
            let worker = MemoryDetailsWorker(
                memoryUseCase: MemoryUseCase(
                    repository: dependencies.makeMemoryRepository()
                )
            )
            self.worker = worker
            return worker
        }
        return worker
    }
    
    func getRouter() -> MemoryDetailsRoutingLogic {
        guard let router = self.router else {
            let router = MemoryDetailsRouter()
            self.router = router
            return router
        }
        return router
    }
    
    @MainActor func configure(
           viewController: MemoryDetailsViewController,
           interactor: MemoryDetailsBusinessLogic,
           presenter: MemoryDetailsPresentationLogic,
           router: MemoryDetailsRoutingLogic
       ) {
           viewController.interactor = interactor
           viewController.router = router
           
           presenter.viewController = viewController
           
           router.viewController = viewController
           router.dataStore = interactor
           // router.factory = self
       }
}

