//
//  OnboardingWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

protocol OnboardingWorkerLogic {}

final class OnboardingWorker: Loggable {
    
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods

// MARK: Private
private extension OnboardingWorker {}

// MARK: - Worker Logic
extension OnboardingWorker: OnboardingWorkerLogic {}
