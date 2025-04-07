//
//  DashboardWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 11/02/2024.
//

import UIKit

protocol DashboardWorkerLogic: AnyObject {}

final class DashboardWorker: Loggable {
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
private extension DashboardWorker {}

// MARK: - Worker Logic
extension DashboardWorker: DashboardWorkerLogic {}
