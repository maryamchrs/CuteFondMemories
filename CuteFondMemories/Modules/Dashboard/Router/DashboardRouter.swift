//
//  DashboardRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 11/02/2024.
//

import UIKit
import SwiftUI

protocol DashboardRoutingLogic: NSObject, DashboardDataPassing {
    var viewController: DashboardViewController? { get set }
    var dataStore: DashboardDataStore? { get set }
    @MainActor func presentMemoryDetailsView(memory: Memory?,
                                             latitude: Double,
                                             longitude: Double)
}

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get set }
}

final class DashboardRouter: NSObject {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init()
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: DashboardViewController?
    var dataStore: DashboardDataStore?
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods

// MARK: Private
private extension DashboardRouter {}

// MARK: Public
extension DashboardRouter {}

// MARK: - Routing Logic
extension DashboardRouter: DashboardRoutingLogic {
    @MainActor func presentMemoryDetailsView(memory: Memory?,
                                             latitude: Double,
                                             longitude: Double) {
        let memoryPreviewFactory: MemoryPreviewViewFactoryProtocol = MemoryPreviewFactory(dependencies: DependencyContainer.shared)
        let destinationViewController = UIHostingController(rootView: memoryPreviewFactory.makeMemoryPreviewView(memory: memory, latitude: latitude, longitude: longitude))
//        destinationViewController.delegate = viewController
//        destinationViewController.modalTransitionStyle = .coverVertical
//        destinationViewController.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
