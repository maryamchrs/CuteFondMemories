//
//  MemoryDetailsFileWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 17/02/2024.
//

import UIKit

protocol MemoryDetailsFileWorkerLogic {
    func saveMemory(memory: CDMemory) throws
}

class MemoryDetailsFileWorker {
    // MARK: - Object lifecycle
    init(storageManager: StorageManagerProtocol) {
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsFileWorker.self))
        self.storageManager = storageManager
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsFileWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let storageManager: StorageManagerProtocol
}

// MARK: - Methods

// MARK: Private
private extension MemoryDetailsFileWorker {}

// MARK: - Worker Logic
extension MemoryDetailsFileWorker: MemoryDetailsFileWorkerLogic {
    func saveMemory(memory: CDMemory) throws {
        try storageManager.saveMemory(memory: memory)
    }
}
