//
//  DependencyContainer.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 09/02/2024.
//

import Foundation

protocol DependencyContainerProtocol {
    static var shared: DependencyContainerProtocol { get }
    var logger: DefaultLoggerProtocol { get }
    func makeStorageManager() -> StorageManagerProtocol
    func makeLocationService() -> LocationServiceProtocol
    func makeMemoryRepository() -> MemoryRepositoryProtocol
}

final class DependencyContainer: DependencyContainerProtocol {
    
    static var shared: DependencyContainerProtocol = DependencyContainer()
    
    private init() {}
    
    var logger: any DefaultLoggerProtocol = Logger()
    
    private let storageManager: StorageManagerProtocol = StorageManager(
        userDefaultManager: UserDefaultsManager(),
        persistenceManager: PersistenceManager.shared
    )
    
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
