//
//  OnboardingRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

protocol OnboardingRoutingLogic {
    //    func navigateToSomewhere()
}

protocol OnboardingDataPassing {
    var dataStore: OnboardingDataStore? { get }
}

final class OnboardingRouter: NSObject, OnboardingDataPassing, Loggable {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init()
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: OnboardingViewController?
    var dataStore: OnboardingDataStore?
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods
// MARK: Public
extension OnboardingRouter {}

// MARK: Private
private extension OnboardingRouter {}

// MARK: - Routing Logic
extension OnboardingRouter: OnboardingRoutingLogic {

}
