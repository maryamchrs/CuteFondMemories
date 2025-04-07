//
//  OnboardingFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import Foundation

protocol OnboardingFactoryProtocol {
    @MainActor func makeOnboardingViewController() -> OnboardingViewController
}

final class OnboardingFactory: Loggable, OnboardingFactoryProtocol {
    // MARK: - Properties
    private(set) var logger: DefaultLoggerProtocol
    
    private(set) weak var interactor: OnboardingBusinessLogic?
    private(set) weak var presenter: OnboardingPresentationLogic?
    private(set) weak var router: OnboardingRoutingLogic?
    
    init(dependencies: DependencyContainerProtocol) {
        self.logger = dependencies.logger
        logInit()
    }
    
    deinit {
        logDeinit()
    }
}

// MARK: - Methods
// MARK: Public
extension OnboardingFactory {
    @MainActor func makeOnboardingViewController() -> OnboardingViewController {
        let viewController = OnboardingViewController()
        let interactor = getInteractor()
        let presenter = getPresenter()
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

// MARK: Private
private extension OnboardingFactory {
    func getInteractor() -> OnboardingBusinessLogic {
        guard let interactor = self.interactor else {
            let interactor = OnboardingInteractor(presenter: getPresenter(),
                                                  worker: OnboardingWorker())
            self.interactor = interactor
            return interactor
        }
        return interactor
    }
    
    func getPresenter() -> OnboardingPresentationLogic {
        guard let presenter = self.presenter else {
            let presenter = OnboardingPresenter()
            self.presenter = presenter
            return presenter
        }
        return presenter
    }
    
    func getRouter() -> OnboardingRoutingLogic {
        guard let router = self.router else {
            let router = OnboardingRouter()
            self.router = router
            return router
        }
        return router
    }
    
    @MainActor func configure(
           viewController: OnboardingViewController,
           interactor: OnboardingBusinessLogic,
           presenter: OnboardingPresentationLogic,
           router: OnboardingRoutingLogic
       ) {
           viewController.interactor = interactor
           viewController.router = router
           
           presenter.viewController = viewController
           
           router.viewController = viewController
           router.dataStore = interactor
       }
}
