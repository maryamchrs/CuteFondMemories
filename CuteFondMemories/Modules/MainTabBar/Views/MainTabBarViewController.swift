//
//  MainTabBarViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 03/06/2024.
//

import UIKit

@MainActor protocol MainTabBarDisplayLogic: AnyObject {}

@MainActor final class MainTabBarViewController: UITabBarController {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        self.logger = Logger()
        super.init(coder: aDecoder)
        self.logger.logInit(String(describing: type(of: self)))
        fatalError("MainTabBarViewController - Initialization using coder Not Allowed.")
    }
    
   @MainActor init(logger: DefaultLoggerProtocol = Logger()) {
       self.logger = logger
       super.init(nibName: MainTabBarViewController.nibName, bundle: nil)
       self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var interactor: MainTabBarBusinessLogic?
    var router: (NSObjectProtocol & MainTabBarRoutingLogic & MainTabBarDataPassing)?
    // MARK: Private
    private(set) var logger: DefaultLoggerProtocol
    
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
        tabBar.backgroundColor = .tabbar
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
    }
    
    func setFont() {}
}
