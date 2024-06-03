//
//  MainTabBarInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import UIKit

protocol MainTabBarBusinessLogic {
    func viewDidLoad(request: MainTabBar.ViewDidLoad.Request)
}

protocol MainTabBarDataStore {}

class MainTabBarInteractor: MainTabBarDataStore {
    // MARK: - Object lifecycle
    init() {
        MainTabBarLogger.logInit(owner: String(describing: MainTabBarInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        MainTabBarLogger.logDeinit(owner: String(describing: MainTabBarInteractor.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var presenter: MainTabBarPresentationLogic?
    var worker: MainTabBarWorkerLogic?
}

// MARK: - Business Logics
extension MainTabBarInteractor: MainTabBarBusinessLogic {
    func viewDidLoad(request: MainTabBar.ViewDidLoad.Request) {
        
    }
}

// MARK: - Methods

// MARK: Public
extension MainTabBarInteractor {}
// MARK: Private
private extension MainTabBarInteractor {}
