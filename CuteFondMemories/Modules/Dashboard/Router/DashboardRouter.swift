//
//  DashboardRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
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

final class DashboardRouter: NSObject, DashboardDataPassing {
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
    @MainActor func presentMemoryDetailsView(memory: Memory?,
                                             latitude: Double,
                                             longitude: Double) {
        
        let destinationViewController = UIHostingController(rootView: MemoryPreviewFactory().makeMemoryPreviewView(memory: memory, latitude: latitude, longitude: longitude))
        //MemoryPreviewFactory().makeMemoryPreviewView()
        
//        let destinationViewController = MemoryDetailsFactory().makeMemoryDetailsViewController(memory: memory,
//                                                                                               latitude: latitude,
//                                                                                               longitude: longitude)
//        destinationViewController.delegate = viewController
//        destinationViewController.modalTransitionStyle = .coverVertical
//        destinationViewController.modalPresentationStyle = .fullScreen
        viewController?.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
