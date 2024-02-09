//
//  DependencyContainer.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation

class DependencyContainer {
    private let storageManager: StorageManager = StorageManager(userDefaultManager: UserDefaultsManager())
}

extension DependencyContainer {
    func makeStorageManager() -> StorageManager {
        return storageManager
    }
}
