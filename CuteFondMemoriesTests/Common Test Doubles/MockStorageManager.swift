//
//  MockStorageManager.swift
//  CuteFondMemoriesTests
//
//  Created by Maryam Chaharsooghi on 01/04/2025.
//

import Foundation
@testable import CuteFondMemories

final class MockStorageManager: StorageManagerProtocol {
    
    private(set) var logCalled: Bool = false
    private(set) var logCallCount: Int = 0
    private(set) var text: String = ""
    
    func isFirstTimeUserOpenApp() async -> Bool {
        true
    }
}

