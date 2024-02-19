//
//  DependencyContainer.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation

class DependencyContainer {
    private let storageManager: StorageManager = StorageManager(userDefaultManager: UserDefaultsManager(),
                                                                persistanceManager: PersistanceManager.shared)
    private lazy var locationService: LocationService = LocationService()
}

extension DependencyContainer {
    func makeStorageManager() -> StorageManager {
        storageManager
    }
    
    func makeLocationService() -> LocationService {
        locationService
    }
}
