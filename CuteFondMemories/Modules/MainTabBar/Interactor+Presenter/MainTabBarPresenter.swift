//
//  MainTabBarPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import UIKit

protocol MainTabBarPresentationLogic {
    //    func presentSomething(response: MainTabBar.Something.Response) async
}

final class MainTabBarPresenter: Loggable {
    // MARK: - Object lifecycle
    init(viewController: MainTabBarDisplayLogic?,
         logger: DefaultLoggerProtocol = Logger()) {
        self.viewController = viewController
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: MainTabBarDisplayLogic?
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods
// MARK: Public
extension MainTabBarPresenter {}

// MARK: Private
private extension MainTabBarPresenter {}

// MARK: - Presentation Logic
extension MainTabBarPresenter: MainTabBarPresentationLogic {}
