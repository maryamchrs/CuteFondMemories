//
//  MainTabBarPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import UIKit

protocol MainTabBarPresentationLogic: AnyObject {
    var viewController: MainTabBarDisplayLogic? { get set }
    //    func presentSomething(response: MainTabBar.Something.Response) async
}

final class MainTabBarPresenter {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
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
