//
//  DependencyContainer.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 09/02/2024.
//

import Foundation

class DependencyContainer {
    private let storageManager: StorageManagerProtocol = StorageManager(userDefaultManager: UserDefaultsManager(),
                                                                persistenceManager: PersistenceManager.shared)
    private lazy var locationService: LocationServiceProtocol = LocationService()
    
}

extension DependencyContainer {
    func makeStorageManager() -> StorageManagerProtocol {
        storageManager
    }
    
    func makeLocationService() -> LocationServiceProtocol {
        locationService
    }
    
    func makeMemoryRepository() -> MemoryRepositoryProtocol {
        MemoryRepository()
    }
}
