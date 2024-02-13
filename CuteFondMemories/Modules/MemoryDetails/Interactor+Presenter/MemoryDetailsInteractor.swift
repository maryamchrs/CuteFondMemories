//
//  MemoryDetailsInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

protocol MemoryDetailsBusinessLogic {
    //    func doSomething(request: MemoryDetails.Something.Request)
}

protocol MemoryDetailsDataStore {}

class MemoryDetailsInteractor: MemoryDetailsDataStore {
    // MARK: - Object lifecycle
    init() {
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsInteractor.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var presenter: MemoryDetailsPresentationLogic?
    var worker: MemoryDetailsWorkerLogic?
}

// MARK: - Methods
// MARK: Public
extension MemoryDetailsInteractor {}

// MARK: Private
private extension MemoryDetailsInteractor {}

// MARK: - Business Logics
extension MemoryDetailsInteractor: MemoryDetailsBusinessLogic {}
