//
//  DashboardWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import UIKit

protocol DashboardWorkerLogic {}

class DashboardWorker {
    // MARK: - Object lifecycle
    init(service: DashboardService) {
        DashboardLogger.logInit(owner: String(describing: DashboardWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        DashboardLogger.logDeinit(owner: String(describing: DashboardWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: DashboardService
}

// MARK: - Methods

// MARK: Private
private extension DashboardWorker {}

// MARK: - Worker Logic
extension DashboardWorker: DashboardWorkerLogic {}
