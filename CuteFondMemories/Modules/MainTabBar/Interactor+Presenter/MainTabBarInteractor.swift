//
//  MainTabBarInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import UIKit

protocol MainTabBarBusinessLogic {
    func viewDidLoad(request: MainTabBar.ViewDidLoad.Request)
}

protocol MainTabBarDataStore {}

final class MainTabBarInteractor: MainTabBarDataStore, Loggable {
    // MARK: - Object lifecycle
    init(
        presenter: MainTabBarPresentationLogic,
        worker: MainTabBarWorkerLogic?,
        logger: DefaultLoggerProtocol = Logger()
    ) {
        self.presenter = presenter
        self.worker = worker
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
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
