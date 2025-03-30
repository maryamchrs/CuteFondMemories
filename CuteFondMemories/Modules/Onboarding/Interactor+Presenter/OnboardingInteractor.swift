//
//  OnboardingInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

protocol OnboardingBusinessLogic: OnboardingDataStore, AnyObject {
    func viewDidLoad(request: Onboarding.ViewDidLoad.Request)
}

protocol OnboardingDataStore {}

final class OnboardingInteractor: Loggable {
    // MARK: - Object lifecycle
    init(presenter: OnboardingPresentationLogic?,
         worker: OnboardingWorkerLogic?,
         logger: DefaultLoggerProtocol = Logger()) {
        self.presenter = presenter
        self.worker = worker
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    private(set) var presenter: OnboardingPresentationLogic?
    private(set) var worker: OnboardingWorkerLogic?
    private(set) var logger: DefaultLoggerProtocol
    
    private(set) var viewDidLoadTask: (Task<(), Never>)?
}

// MARK: - Methods
// MARK: Public
extension OnboardingInteractor {}

// MARK: Private
private extension OnboardingInteractor {}

// MARK: - Business Logics
extension OnboardingInteractor: OnboardingBusinessLogic {
    func viewDidLoad(request: Onboarding.ViewDidLoad.Request) {
        viewDidLoadTask?.cancel()
        viewDidLoadTask = Task {
            let description = "onboarding_description".localize
            let response = Onboarding.ShowDescription.Response(description: description)
            await presenter?.presentDescription(response: response)
        }
    }
}
