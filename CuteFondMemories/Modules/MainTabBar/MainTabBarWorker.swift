//
//  MainTabBarWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import UIKit

protocol MainTabBarWorkerLogic {}

class MainTabBarWorker {
    // MARK: - Object lifecycle
    init(service: MainTabBarService) {
        MainTabBarLogger.logInit(owner: String(describing: MainTabBarWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        MainTabBarLogger.logDeinit(owner: String(describing: MainTabBarWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: MainTabBarService
}

// MARK: - Methods

// MARK: Private
private extension MainTabBarWorker {}

// MARK: - Worker Logic
extension MainTabBarWorker: MainTabBarWorkerLogic {}
