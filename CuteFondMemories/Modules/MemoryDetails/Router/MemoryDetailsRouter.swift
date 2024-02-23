//
//  MemoryDetailsRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

protocol MemoryDetailsRoutingLogic {
    func dismiss()
}

protocol MemoryDetailsDataPassing {
    var dataStore: MemoryDetailsDataStore? { get }
}

final class MemoryDetailsRouter: NSObject, MemoryDetailsDataPassing {
    // MARK: - Object lifecycle
    override init() {
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsRouter.self))
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsRouter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: MemoryDetailsViewController?
    weak var factory: MemoryDetailsFactory?
    var dataStore: MemoryDetailsDataStore?
    
}

// MARK: - Methods
// MARK: Public
extension MemoryDetailsRouter {}

// MARK: Private
private extension MemoryDetailsRouter {}

// MARK: - Routing Logic
extension MemoryDetailsRouter: MemoryDetailsRoutingLogic {
    func dismiss() {
        viewController?.dismiss(animated: true)
    }
}
