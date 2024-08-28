//
//  OnboardingPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import UIKit

protocol OnboardingPresentationLogic {
    //    func presentSomething(response: Onboarding.Something.Response) async
}

class OnboardingPresenter {
    // MARK: - Object lifecycle
    init() {
        OnboardingLogger.logInit(owner: String(describing: OnboardingPresenter.self))
    }
    
    // MARK: - Deinit
    deinit {
        OnboardingLogger.logDeinit(owner: String(describing: OnboardingPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: OnboardingDisplayLogic?
}

// MARK: - Methods
// MARK: Public
extension OnboardingPresenter {}

// MARK: Private
private extension OnboardingPresenter {}

// MARK: - Presentation Logic
extension OnboardingPresenter: OnboardingPresentationLogic {}
