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

final class MainTabBarRouter: NSObject, MainTabBarDataPassing, Loggable {
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
