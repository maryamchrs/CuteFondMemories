//
//  MemoryDetailsFileWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 17/02/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MemoryDetailsFileWorkerLogic {}

class MemoryDetailsFileWorker {
    // MARK: - Object lifecycle
    init(service: MemoryDetailsFileServiceProtocol) {
        MemoryDetailsFileLogger.logInit(owner: String(describing: MemoryDetailsFileWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsFileLogger.logDeinit(owner: String(describing: MemoryDetailsFileWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: MemoryDetailsFileServiceProtocol
}

// MARK: - Methods

// MARK: Private
private extension MemoryDetailsFileWorker {}

// MARK: - Worker Logic
extension MemoryDetailsFileWorker: MemoryDetailsFileWorkerLogic {}
