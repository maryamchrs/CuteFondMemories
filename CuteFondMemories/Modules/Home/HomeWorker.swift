//
//  HomeWorker.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import UIKit

protocol HomeWorkerLogic: AnyObject {}

final class HomeWorker {
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
private extension HomeWorker {}

// MARK: - Worker Logic
extension HomeWorker: HomeWorkerLogic {}
