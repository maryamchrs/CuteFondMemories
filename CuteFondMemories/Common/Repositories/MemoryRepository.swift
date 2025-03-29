//
//  MemoryRepository.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 30/08/2024.
//

import Foundation

protocol MemoryRepositoryProtocol {
    func saveMemory(info: MemoryDetails.NewMemoryDetailsInfo) async throws
    func updateMemory(memory: Memory) async throws
    func fetchMemories() async throws -> [Memory]
    func retrieveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory?
}

final class MemoryRepository: MemoryRepositoryProtocol {
    
    private(set) var localRepo: MemoryLocalRepositoryProtocol
    private(set) var remoteRepo: MemoryRemoteRepositoryProtocol
    
    init(
        localRepository: MemoryLocalRepositoryProtocol = MemoryLocalRepository(
            persistenceManager: PersistenceManager.shared
        ),
        remoteRepository: MemoryRemoteRepositoryProtocol = MemoryRemoteRepository(
            networkManager: NetworkManager()
        )
    ) {
        localRepo = localRepository
        remoteRepo = remoteRepository
    }
}

extension MemoryRepository {
    // TODO: Complete this part
    func saveMemory(info: MemoryDetails.NewMemoryDetailsInfo) async throws {}
    func updateMemory(memory: Memory) async throws {}
    func fetchMemories() async throws -> [Memory] { [] }
    func retrieveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory? { nil }
}
