//
//  MainTabBarViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import UIKit

@MainActor protocol MainTabBarDisplayLogic: AnyObject {}

@MainActor final class MainTabBarViewController: UITabBarController {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("MainTabBarViewController - Initialization using coder Not Allowed.")
    }
    
   @MainActor init() {
       super.init(nibName: MainTabBarViewController.nibName, bundle: nil)
        MainTabBarLogger.logInit(owner: String(describing: MainTabBarViewController.self))
    }
    
    // MARK: - Deinit
    deinit {
        MainTabBarLogger.logDeinit(owner: String(describing: MainTabBarViewController.self))
    }
    
    // MARK: - Properties
    
    // MARK: Private
    
    // MARK: Public
    var interactor: MainTabBarBusinessLogic?
    var router: (NSObjectProtocol & MainTabBarRoutingLogic & MainTabBarDataPassing)?
    // MARK: - Outlets
}

// MARK: - View Controller

// MARK: Life Cycle
extension MainTabBarViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setColor()
        setFont()
        
        selectedIndex = 0
    }
}

// MARK: - Methods

// MARK: Private
private extension MainTabBarViewController {
    func setupUI() {
//        tabBar.isTranslucent = false
    }
}

// MARK: Public
extension MainTabBarViewController {}

// MARK: - Display Logic
extension MainTabBarViewController: MainTabBarDisplayLogic {}

// MARK: - Actions
extension MainTabBarViewController {}

// MARK: - Appearance
extension MainTabBarViewController {
    func setColor() {
        tabBar.backgroundColor = .blueishGreen
        tabBar.tintColor = .lightRoseGold
        tabBar.unselectedItemTintColor = .lightRoseGold
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
    }
    
    func setFont() {}
}
