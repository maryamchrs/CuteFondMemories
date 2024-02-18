//
//  MemoryDetailsFileWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 17/02/2024.
//

import UIKit

protocol MemoryDetailsFileWorkerLogic {
    func saveMemory(title: String,
                    desctiprionOfMemory: String,
                    date: Date?,
                    image: Data?,
                    latitude: Double,
                    longitude: Double) async throws
    func fetchMemories() async throws -> [Memory]
    func retriveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory?
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
    func saveMemory(title: String,
                    desctiprionOfMemory: String,
                    date: Date?,
                    image: Data?,
                    latitude: Double,
                    longitude: Double) async throws {
        
        try await storageManager.saveMemory(title: title,
                                            desctiprionOfMemory: desctiprionOfMemory,
                                            date: date,
                                            image: image,
                                            latitude: latitude,
                                            longitude: longitude)
    }
    
    func fetchMemories() async throws -> [Memory] {
        try await storageManager.fetchMemories()
    }
    
    func retriveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory? {
        try await storageManager.retriveMemoryBasedOnLocation(latitude: latitude, longitude: longitude)
    }
}
