//
//  MemoryPreviewInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 08/07/2024.
//

import UIKit

protocol MemoryPreviewBusinessLogic {
    //    func doSomething(request: MemoryPreview.Something.Request)
}

protocol MemoryPreviewDataStore {}

final class MemoryPreviewInteractor: MemoryPreviewDataStore {
    // MARK: - Object lifecycle
    init() {
        Logger.logInit(owner: String(describing: MemoryPreviewInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        Logger.logDeinit(owner: String(describing: MemoryPreviewInteractor.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var presenter: MemoryPreviewPresenter?
    var worker: MemoryPreviewWorkerLogic?
}

// MARK: - Methods

// MARK: Private
private extension MemoryPreviewInteractor {}

// MARK: Public
extension MemoryPreviewInteractor {}

// MARK: - Business Logics
extension MemoryPreviewInteractor: MemoryPreviewBusinessLogic {}
