//
//  OnboardingInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

protocol OnboardingBusinessLogic: OnboardingDataStore {
    func viewDidLoad(request: Onboarding.ViewDidLoad.Request)
}

protocol OnboardingDataStore: AnyObject {}

final class OnboardingInteractor {
    // MARK: - Object lifecycle
    init(presenter: OnboardingPresentationLogic,
         worker: OnboardingWorkerLogic,
         logger: DefaultLoggerProtocol = Logger()) {
        self.presenter = presenter
        self.worker = worker
        self.logger = logger
         self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        cleanup()
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    private(set) var presenter: OnboardingPresentationLogic
    private(set) var worker: OnboardingWorkerLogic
    private(set) var logger: DefaultLoggerProtocol
    
    var viewDidLoadTask: (Task<(), Never>)?
}

// MARK: - Methods
// MARK: Public
extension OnboardingInteractor {}

// MARK: Private
private extension OnboardingInteractor {
    func cleanup() {
        viewDidLoadTask?.cancel()
        viewDidLoadTask = nil
    }
}

// MARK: - Business Logics
extension OnboardingInteractor: OnboardingBusinessLogic {
    func viewDidLoad(request: Onboarding.ViewDidLoad.Request) {
        viewDidLoadTask?.cancel()
        viewDidLoadTask = Task {
            let description = "onboarding_description".localize
            let response = Onboarding.ShowDescription.Response(description: description)
            await presenter.presentDescription(response: response)
        }
    }
}
