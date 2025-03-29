//
//  MainTabBarWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import UIKit

protocol MainTabBarWorkerLogic {}

final class MainTabBarWorker: Loggable {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods

// MARK: Private
private extension MainTabBarWorker {}

// MARK: - Worker Logic
extension MainTabBarWorker: MainTabBarWorkerLogic {}
