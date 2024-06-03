//
//  SettingViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@MainActor protocol SettingDisplayLogic: AnyObject {}

@MainActor final class SettingViewController: UIViewController {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("SettingViewController - Initialization using coder Not Allowed.")
    }
    
   @MainActor init() {
        super.init(nibName: SettingViewController.nibName, bundle: nil)
        SettingLogger.logInit(owner: String(describing: SettingViewController.self))
    }
    
    // MARK: - Deinit
    deinit {
        SettingLogger.logDeinit(owner: String(describing: SettingViewController.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    
    // MARK: Public
    var interactor: SettingBusinessLogic?
    var router: (NSObjectProtocol & SettingRoutingLogic & SettingDataPassing)?
    
    // MARK: - Outlets
}

// MARK: - View Controller

// MARK: Life Cycle
extension SettingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Methods

// MARK: Private
private extension SettingViewController {}

// MARK: Public
extension SettingViewController {}

// MARK: - Display Logic
extension SettingViewController: SettingDisplayLogic {}

// MARK: - Actions
extension SettingViewController {}

// MARK: - Appearance
extension SettingViewController: Appearance {
    func setColor() {}
    
    func setFont() {}
}
