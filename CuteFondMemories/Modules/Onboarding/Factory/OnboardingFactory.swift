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

final class OnboardingFactory: Loggable {
    // MARK: - Properties
    private(set) weak var interactor: OnboardingInteractor?
    private(set) weak var presenter: OnboardingPresenter?
    private(set) weak var router: OnboardingRouter?
    private(set) var logger: DefaultLoggerProtocol
    
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
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
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}

// MARK: Private
private extension OnboardingFactory {
    func getInteractor() -> OnboardingInteractor {
        guard let interactor = self.interactor else {
            let interactor = OnboardingInteractor(presenter: getPresenter(),
                                                  worker: OnboardingWorker())
            self.interactor = interactor
            return interactor
        }
        return interactor
    }
    
    func getPresenter() -> OnboardingPresenter {
        guard let presenter = self.presenter else {
            let presenter = OnboardingPresenter()
            self.presenter = presenter
            return presenter
        }
        return presenter
    }
    
    func getRouter() -> OnboardingRouter {
        guard let router = self.router else {
            let router = OnboardingRouter()
            self.router = router
            return router
        }
        return router
    }
}
