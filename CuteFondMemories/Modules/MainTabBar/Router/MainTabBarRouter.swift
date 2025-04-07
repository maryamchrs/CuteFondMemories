//
//  MainTabBarRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import UIKit

protocol MainTabBarDataPassing {
    var dataStore: MainTabBarDataStore? { get }
}

protocol MainTabBarRoutingLogic: MainTabBarDataPassing, AnyObject {
    var viewController: MainTabBarViewController? { get set }
    var dataStore: MainTabBarDataStore? { get set }
}

final class MainTabBarRouter: Loggable {
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
