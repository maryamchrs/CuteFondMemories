//
//  OnboardingInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import UIKit

protocol OnboardingBusinessLogic {
    //    func doSomething(request: Onboarding.Something.Request)
}

protocol OnboardingDataStore {}

class OnboardingInteractor: OnboardingDataStore {
    // MARK: - Object lifecycle
    init() {
        OnboardingLogger.logInit(owner: String(describing: OnboardingInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        OnboardingLogger.logDeinit(owner: String(describing: OnboardingInteractor.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var presenter: OnboardingPresentationLogic?
    var worker: OnboardingWorkerLogic?
}

// MARK: - Methods
// MARK: Public
extension OnboardingInteractor {}

// MARK: Private
private extension OnboardingInteractor {}

// MARK: - Business Logics
extension OnboardingInteractor: OnboardingBusinessLogic {}
