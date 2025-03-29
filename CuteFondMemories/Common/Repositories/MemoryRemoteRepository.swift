//
//  MemoryRemoteRepository.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 30/08/2024.
//

import Foundation

protocol MemoryRemoteRepositoryProtocol {
    func fetchMemories() async throws -> [Memory]
}

final class MemoryRemoteRepository: MemoryRemoteRepositoryProtocol {
    
    private(set) var networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension MemoryRemoteRepository {
    func fetchMemories() async throws -> [Memory] {
        // DEMO
        // guard let urlRequest = DashboardEndpoint.something.urlRequest else { return }
        // return try await httpClient.perform(urlRequest)
        return []
    }
}
