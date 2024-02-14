//
//  DashboardRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import UIKit

protocol DashboardRoutingLogic {
    @MainActor func presentMemoryDetailsView()
}

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get }
}

class DashboardRouter: NSObject, DashboardDataPassing {
    // MARK: - Object lifecycle
    override init() {
        DashboardLogger.logInit(owner: String(describing: DashboardRouter.self))
    }
    
    // MARK: - Deinit
    deinit {
        DashboardLogger.logDeinit(owner: String(describing: DashboardRouter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: DashboardViewController?
    weak var factory: DashboardFactory?
    var dataStore: DashboardDataStore?
}

// MARK: - Methods

// MARK: Private
private extension DashboardRouter {}

// MARK: Public
extension DashboardRouter {}

// MARK: - Routing Logic
extension DashboardRouter: DashboardRoutingLogic {
    @MainActor func presentMemoryDetailsView() {
        let destinationViewController = MemoryDetailsFactory().makeMemoryDetailsViewController()
        destinationViewController.modalTransitionStyle = .coverVertical
        destinationViewController.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.present(destinationViewController, animated: true)
    }
}
