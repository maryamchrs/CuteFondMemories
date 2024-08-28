//
//  OnboardingDependencyContainer.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import Foundation

class OnboardingDependencyContainer: DependencyContainer {
    
    // MARK: - Object lifecycle
    override init() {
        OnboardingLogger.logInit(owner: String(describing: OnboardingDependencyContainer.self))
    }
    
    // MARK: - Deinit
    deinit {
        OnboardingLogger.logDeinit(owner: String(describing: OnboardingDependencyContainer.self))
    }
    
    // MARK: - Properties
    private weak var interactor: OnboardingInteractor?
    private weak var presenter: OnboardingPresenter?
    private weak var service: OnboardingService?
    private weak var router: OnboardingRouter?
}

// MARK: - Factory
extension OnboardingDependencyContainer {
    @MainActor func makeOnboardingViewController() -> OnboardingViewController {
        let viewController = OnboardingViewController()
        let interactor = getInteractor()
        let presenter = getPresenter()
        let router = getRouter()
        let worker = OnboardingWorker(service: makeOnboardingService())
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
//        router.factory = self
        
        return viewController
    }
    
    func makeOnboardingService() -> OnboardingService {
        return OnboardingService(httpClient: URLSession.shared)
    }
}

// MARK: - Private Methods

private extension OnboardingDependencyContainer {
    func getInteractor() -> OnboardingInteractor {
        guard let interactor = self.interactor else {
            let interactor = OnboardingInteractor()
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
