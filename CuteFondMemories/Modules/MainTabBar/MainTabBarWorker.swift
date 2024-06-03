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
    init() {
        MainTabBarLogger.logInit(owner: String(describing: MainTabBarWorker.self))
    }
    
    // MARK: - Deinit
    deinit {
        MainTabBarLogger.logDeinit(owner: String(describing: MainTabBarWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
}

// MARK: - Methods

// MARK: Private
private extension MainTabBarWorker {}

// MARK: - Worker Logic
extension MainTabBarWorker: MainTabBarWorkerLogic {}
