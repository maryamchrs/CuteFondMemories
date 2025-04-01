//
//  MainTabBarRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import UIKit

protocol MainTabBarRoutingLogic {
    //    func navigateToSomewhere()
}

protocol MainTabBarDataPassing {
    var dataStore: MainTabBarDataStore? { get }
}

final class MainTabBarRouter: NSObject, MainTabBarDataPassing {
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
    weak var viewController: MainTabBarViewController?
    var dataStore: MainTabBarDataStore?
    
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods
// MARK: Public
extension MainTabBarRouter {}

// MARK: Private
private extension MainTabBarRouter {}

// MARK: - Routing Logic
extension MainTabBarRouter: MainTabBarRoutingLogic {}
