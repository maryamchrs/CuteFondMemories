//
//  HomeRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import UIKit

protocol HomeRoutingLogic {
    // func navigateToSomewhere()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

final class HomeRouter: HomeDataPassing, Loggable {
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
    
    // MARK: Public
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods
// MARK: Public
extension HomeRouter {}

// MARK: Private
private extension HomeRouter {}

// MARK: - Routing Logic
extension HomeRouter: HomeRoutingLogic {}
