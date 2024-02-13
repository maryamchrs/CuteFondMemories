//
//  MemoryDetailsViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

@MainActor protocol MemoryDetailsDisplayLogic: AnyObject {}

@MainActor final class MemoryDetailsViewController: UIViewController, NibLoadable {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("MemoryDetailsViewController - Initialization using coder Not Allowed.")
    }
    
   @MainActor init() {
        super.init(nibName: MemoryDetailsViewController.nibName, bundle: nil)
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsViewController.self))
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsViewController.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    
    // MARK: Public
    var interactor: MemoryDetailsBusinessLogic?
    var router: (NSObjectProtocol & MemoryDetailsRoutingLogic & MemoryDetailsDataPassing)?
    
    // MARK: - Outlets
}

// MARK: - View Controller

// MARK: Life Cycle
extension MemoryDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Methods

// MARK: Private
private extension MemoryDetailsViewController {}

// MARK: Public
extension MemoryDetailsViewController {}

// MARK: - Display Logic
extension MemoryDetailsViewController: MemoryDetailsDisplayLogic {}

// MARK: - Actions
extension MemoryDetailsViewController {}

// MARK: - Appearance
extension MemoryDetailsViewController {
    func setColor() {}
    
    func setFont() {}
}
