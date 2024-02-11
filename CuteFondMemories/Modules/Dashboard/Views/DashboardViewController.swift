//
//  DashboardViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import UIKit

@MainActor protocol DashboardDisplayLogic: AnyObject {}

@MainActor final class DashboardViewController: UIViewController, NibLoadable {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("DashboardViewController - Initialization using coder Not Allowed.")
    }
    
   @MainActor init() {
        super.init(nibName: DashboardViewController.nibName, bundle: nil)
        DashboardLogger.logInit(owner: String(describing: DashboardViewController.self))
    }
    
    // MARK: - Deinit
    deinit {
        DashboardLogger.logDeinit(owner: String(describing: DashboardViewController.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    
    // MARK: Public
    var interactor: DashboardBusinessLogic?
    var router: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)?
    
    // MARK: - Outlets
    
    // MARK: Life Cycle
    // swiftlint:disable:next unneeded_override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Methods

// MARK: Public
extension DashboardViewController {}

// MARK: Private
private extension DashboardViewController {}

// MARK: - Display Logic
extension DashboardViewController: DashboardDisplayLogic {}

// MARK: - Actions
extension DashboardViewController {}

private extension DashboardViewController {
    func setColor() {}
    
    func setFont() {}
}
