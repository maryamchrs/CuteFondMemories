//
//  MainTabBarRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import UIKit

protocol MainTabBarRoutingLogic {
    //    func navigateToSomewhere()
}

protocol MainTabBarDataPassing {
    var dataStore: MainTabBarDataStore? { get }
}

class MainTabBarRouter: NSObject, MainTabBarDataPassing {
    // MARK: - Object lifecycle
    override init() {
        MainTabBarLogger.logInit(owner: String(describing: MainTabBarRouter.self))
    }
    
    // MARK: - Deinit
    deinit {
        MainTabBarLogger.logDeinit(owner: String(describing: MainTabBarRouter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: MainTabBarViewController?
    var dataStore: MainTabBarDataStore?
    var factory: MainTabBarFactoryProtocolr?
}

// MARK: - Methods
// MARK: Public
extension MainTabBarRouter {}

// MARK: Private
private extension MainTabBarRouter {}

// MARK: - Routing Logic
extension MainTabBarRouter: MainTabBarRoutingLogic {

}
