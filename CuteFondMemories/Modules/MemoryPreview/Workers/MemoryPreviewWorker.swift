//
//  MemoryPreviewWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 08/07/2024.
//

import UIKit

protocol MemoryPreviewWorkerLogic {}

class MemoryPreviewWorker {
    // MARK: - Object lifecycle
    init(service: MemoryPreviewServiceProtocol) {
        MemoryPreviewLogger.logInit(owner: String(describing: MemoryPreviewWorker.self))
        self.service = service
    }
    
    // MARK: - Deinit
    deinit {
        MemoryPreviewLogger.logDeinit(owner: String(describing: MemoryPreviewWorker.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private let service: MemoryPreviewServiceProtocol
}

// MARK: - Methods

// MARK: Private
private extension MemoryPreviewWorker {}

// MARK: - Worker Logic
extension MemoryPreviewWorker: MemoryPreviewWorkerLogic {}
