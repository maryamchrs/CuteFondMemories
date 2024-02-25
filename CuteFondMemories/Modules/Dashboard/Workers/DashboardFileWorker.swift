//
//  DashboardFileWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 25/02/2024.
//

import UIKit

protocol DashboardFileWorkerLogic {
    func fetchMemories() async throws -> [Memory]
    func retriveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory?
}

class DashboardFileWorker {
    // MARK: - Object lifecycle
    init(storageManager: StorageManagerProtocol) {
        DashboardLogger.logInit(owner: String(describing: DashboardFileWorker.self))
        self.storageManager = storageManager
    }
    
    // MARK: - Deinit
    deinit {
        DashboardLogger.logDeinit(owner: String(describing: DashboardFileWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let storageManager: StorageManagerProtocol
}

// MARK: - Methods

// MARK: Private
private extension DashboardFileWorker {}

// MARK: - Worker Logic
extension DashboardFileWorker: DashboardFileWorkerLogic {
    func fetchMemories() async throws -> [Memory] {
        try await storageManager.fetchMemories()
    }
    
    func retriveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory? {
        try await storageManager.retriveMemoryBasedOnLocation(latitude: latitude, longitude: longitude)
    }
}
