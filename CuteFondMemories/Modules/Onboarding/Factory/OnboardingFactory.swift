//
//  OnboardingFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import Foundation

protocol OnboardingFactoryProtocol {
    func makeOnboardingViewController() -> OnboardingViewController
}

protocol OnboardingServiceFactory {
    func makeOnboardingService() -> OnboardingService
}

class OnboardingFactory {
 @MainActor func makeOnboardingViewController() -> OnboardingViewController {
        let viewController = OnboardingViewController()
        let interactor = OnboardingInteractor()
        let presenter = OnboardingPresenter()
        let router = OnboardingRouter()
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
