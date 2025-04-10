//
//  MemoryPreviewWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 08/07/2024.
//

import UIKit

protocol MemoryPreviewWorkerLogic {}

final class MemoryPreviewWorker {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods

// MARK: Private
private extension MemoryPreviewWorker {}

// MARK: - Worker Logic
extension MemoryPreviewWorker: MemoryPreviewWorkerLogic {}
