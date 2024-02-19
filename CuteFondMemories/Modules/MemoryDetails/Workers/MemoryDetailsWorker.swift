//
//  MemoryDetailsWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

protocol MemoryDetailsWorkerLogic {}

final class MemoryDetailsWorker {
    // MARK: - Object lifecycle
    init(service: MemoryDetailsService) {
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: MemoryDetailsService
}

// MARK: - Methods

// MARK: Private
private extension MemoryDetailsWorker {}

// MARK: - Worker Logic
extension MemoryDetailsWorker: MemoryDetailsWorkerLogic {}
