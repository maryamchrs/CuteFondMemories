//
//  OnboardingRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import UIKit

protocol OnboardingRoutingLogic {
    //    func navigateToSomewhere()
}

protocol OnboardingDataPassing {
    var dataStore: OnboardingDataStore? { get }
}

class OnboardingRouter: NSObject, OnboardingDataPassing {
    // MARK: - Object lifecycle
    override init() {
        OnboardingLogger.logInit(owner: String(describing: OnboardingRouter.self))
    }
    
    // MARK: - Deinit
    deinit {
        OnboardingLogger.logDeinit(owner: String(describing: OnboardingRouter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: OnboardingViewController?
    var dataStore: OnboardingDataStore?
//    var factory: OnboardingFactoryProtocolr?
}

// MARK: - Methods
// MARK: Public
extension OnboardingRouter {}

// MARK: Private
private extension OnboardingRouter {}

// MARK: - Routing Logic
extension OnboardingRouter: OnboardingRoutingLogic {

}
