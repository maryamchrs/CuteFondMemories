//
//  MainTabBarPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import UIKit

protocol MainTabBarPresentationLogic {
    //    func presentSomething(response: MainTabBar.Something.Response) async
}

class MainTabBarPresenter {
    // MARK: - Object lifecycle
    init() {
        MainTabBarLogger.logInit(owner: String(describing: MainTabBarPresenter.self))
    }
    
    // MARK: - Deinit
    deinit {
        MainTabBarLogger.logDeinit(owner: String(describing: MainTabBarPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: MainTabBarDisplayLogic?
}

// MARK: - Methods
// MARK: Public
extension MainTabBarPresenter {}

// MARK: Private
private extension MainTabBarPresenter {}

// MARK: - Presentation Logic
extension MainTabBarPresenter: MainTabBarPresentationLogic {}
