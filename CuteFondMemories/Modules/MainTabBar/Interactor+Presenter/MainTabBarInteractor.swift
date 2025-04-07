//
//  MainTabBarInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import UIKit

protocol MainTabBarDataStore {}

protocol MainTabBarBusinessLogic: MainTabBarDataStore, AnyObject {
    func viewDidLoad(request: MainTabBar.ViewDidLoad.Request)
}

final class MainTabBarInteractor {
    // MARK: - Object lifecycle
    init(
        presenter: MainTabBarPresentationLogic,
        worker: MainTabBarWorkerLogic?,
        logger: DefaultLoggerProtocol = Logger()
    ) {
        self.presenter = presenter
        self.worker = worker
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    private(set) var presenter: MainTabBarPresentationLogic?
    private(set) var worker: MainTabBarWorkerLogic?
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Business Logics
extension MainTabBarInteractor: MainTabBarBusinessLogic {
    func viewDidLoad(request: MainTabBar.ViewDidLoad.Request) {}
}

// MARK: - Methods

// MARK: Public
extension MainTabBarInteractor {}
// MARK: Private
private extension MainTabBarInteractor {}
