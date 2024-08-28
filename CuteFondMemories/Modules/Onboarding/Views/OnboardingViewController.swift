//
//  OnboardingViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import UIKit

@MainActor protocol OnboardingDisplayLogic: AnyObject {}

@MainActor final class OnboardingViewController: UIViewController {
    // MARK: - Object lifecycle
   @MainActor init() {
        super.init(nibName: OnboardingViewController.nibName, bundle: nil)
        OnboardingLogger.logInit(owner: String(describing: OnboardingViewController.self))
    }
    
    // MARK: - Deinit
    deinit {
        OnboardingLogger.logDeinit(owner: String(describing: OnboardingViewController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("OnboardingViewController - Initialization using coder Not Allowed.")
    }
    
    // MARK: - Properties
    
    // MARK: Private
    
    // MARK: Public
    var interactor: OnboardingBusinessLogic?
    var router: (NSObjectProtocol & OnboardingRoutingLogic & OnboardingDataPassing)?
    
    // MARK: - Outlets
}

// MARK: - View Controller

// MARK: Life Cycle
extension OnboardingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Methods

// MARK: Private
private extension OnboardingViewController {}

// MARK: Public
extension OnboardingViewController {}

// MARK: - Display Logic
extension OnboardingViewController: OnboardingDisplayLogic {}

// MARK: - Actions
extension OnboardingViewController {}

// MARK: - Appearance
extension OnboardingViewController {
    func setColor() {}
    
    func setFont() {}
}
