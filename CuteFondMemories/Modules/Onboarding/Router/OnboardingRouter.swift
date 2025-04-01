//
//  OnboardingRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import UIKit

protocol OnboardingRoutingLogic: NSObject, OnboardingDataPassing {
    var viewController: OnboardingViewController? { get set }
    var dataStore: OnboardingDataStore? { get set }
    //    func navigateToSomewhere()
}

protocol OnboardingDataPassing {
    var dataStore: OnboardingDataStore? { get }
}

final class OnboardingRouter: NSObject {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init()
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
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
