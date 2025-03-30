//
//  DashboardRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 11/02/2024.
//

import UIKit
import SwiftUI

protocol DashboardRoutingLogic {
    @MainActor func presentMemoryDetailsView(memory: Memory?,
                                             latitude: Double,
                                             longitude: Double)
}

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get }
}

final class DashboardRouter: NSObject, DashboardDataPassing, Loggable {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init()
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: DashboardViewController?
    weak var factory: DashboardFactory?
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
