//
//  SettingWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import UIKit

protocol SettingWorkerLogic {}

class SettingWorker {
    // MARK: - Object lifecycle
    init(service: SettingService) {
        SettingLogger.logInit(owner: String(describing: SettingWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        SettingLogger.logDeinit(owner: String(describing: SettingWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: SettingService
}

// MARK: - Methods

// MARK: Private
private extension SettingWorker {}

// MARK: - Worker Logic
extension SettingWorker: SettingWorkerLogic {}
