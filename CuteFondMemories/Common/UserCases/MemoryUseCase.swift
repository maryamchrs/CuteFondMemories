//
//  MemoryUseCase.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 30/08/2024.
//

import Foundation

protocol MemoryUseCaseProtocol {
    // TODO: Split these method to separate UseCases
    func saveMemory(info: MemoryDetails.NewMemoryDetailsInfo) async throws
    func updateMemory(memory: Memory) async throws
    func fetchMemories() async throws -> [Memory]
    func retrieveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory?
}

final class MemoryUseCase: MemoryUseCaseProtocol {
    
    private let repository: MemoryRepositoryProtocol

    init(repository: MemoryRepositoryProtocol) {
        self.repository = repository
    }
}

extension MemoryUseCase {
    func saveMemory(info: MemoryDetails.NewMemoryDetailsInfo) async throws {
        try await repository.saveMemory(info: info)
    }

    func updateMemory(memory: Memory) async throws {
        try await repository.updateMemory(memory: memory)
    }
    
    func fetchMemories() async throws -> [Memory] {
        try await repository.fetchMemories()
    }
    
    func retrieveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory? {
        try await repository.retrieveMemoryBasedOnLocation(latitude: latitude, longitude: longitude)
    }
}
