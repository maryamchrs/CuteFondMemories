//
//  MemoryDetailsWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 13/02/2024.
//

import UIKit

protocol MemoryDetailsWorkerLogic {
    func saveMemory(info: MemoryDetails.NewMemoryDetailsInfo) async throws
    func updateMemory(_ memory: Memory) async throws
    func fetchMemories() async throws -> [Memory]
    func retrieveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory?
}

final class MemoryDetailsWorker {
    // MARK: - Object lifecycle
    init(memoryUseCase: MemoryUseCaseProtocol,
         logger: DefaultLoggerProtocol = Logger()) {
        self.memoryUseCase = memoryUseCase
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private(set) var memoryUseCase: MemoryUseCaseProtocol
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods

// MARK: Private
private extension MemoryDetailsWorker {}

// MARK: - Worker Logic
extension MemoryDetailsWorker: MemoryDetailsWorkerLogic {
    
    func saveMemory(info: MemoryDetails.NewMemoryDetailsInfo) async throws {
        try await memoryUseCase.saveMemory(info: info)
    }
    
    func updateMemory(_ memory: Memory) async throws {
       try await memoryUseCase.updateMemory(memory: memory)
    }
    
    func fetchMemories() async throws -> [Memory] {
        try await memoryUseCase.fetchMemories()
    }
    
    func retrieveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory? {
        try await memoryUseCase.retrieveMemoryBasedOnLocation(
            latitude: latitude,
            longitude: longitude
        )
    }
}
