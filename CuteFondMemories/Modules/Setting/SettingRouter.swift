//
//  SettingRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import UIKit

protocol SettingRoutingLogic {
    //    func navigateToSomewhere()
}

protocol SettingDataPassing {
    var dataStore: SettingDataStore? { get }
}

class SettingRouter: NSObject, SettingDataPassing {
    // MARK: - Object lifecycle
    override init() {
        SettingLogger.logInit(owner: String(describing: SettingRouter.self))
    }
    
    // MARK: - Deinit
    deinit {
        SettingLogger.logDeinit(owner: String(describing: SettingRouter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: SettingViewController?
    var dataStore: SettingDataStore?
    var factory: SettingFactoryProtocolr?
}

// MARK: - Methods
// MARK: Public
extension SettingRouter {}

// MARK: Private
private extension SettingRouter {}

// MARK: - Routing Logic
extension SettingRouter: SettingRoutingLogic {

}
