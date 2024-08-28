//
//  OnboardingWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import UIKit

protocol OnboardingWorkerLogic {}

class OnboardingWorker {
    // MARK: - Object lifecycle
    init(service: OnboardingService) {
        OnboardingLogger.logInit(owner: String(describing: OnboardingWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        OnboardingLogger.logDeinit(owner: String(describing: OnboardingWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: OnboardingService
}

// MARK: - Methods

// MARK: Private
private extension OnboardingWorker {}

// MARK: - Worker Logic
extension OnboardingWorker: OnboardingWorkerLogic {}
