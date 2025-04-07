//
//  HomeViewController.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import UIKit

@MainActor protocol HomeDisplayLogic: AnyObject {
    var interactor: HomeBusinessLogic? { get set }
    var router: HomeRoutingLogic? { get set }
}

@MainActor final class HomeViewController: UIViewController {
    // MARK: - Object lifecycle
    required init?(coder aDecoder: NSCoder) {
        self.logger = Logger()
        super.init(coder: aDecoder)
        self.logger.logInit(String(describing: type(of: self)))
        fatalError("HomeViewController - Initialization using coder Not Allowed.")
    }
    
    @MainActor init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init(nibName: HomeViewController.nibName, bundle: nil)
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var interactor: HomeBusinessLogic?
    var router: HomeRoutingLogic?
    // MARK: Private
    private(set) var logger: DefaultLoggerProtocol
    
    // MARK: - Outlets
    @IBOutlet private(set) weak var collectionView: UICollectionView!
}

// MARK: - View Controller

// MARK: Life Cycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setColor()
        setFont()
    }
}

// MARK: - Methods

// MARK: Private
private extension HomeViewController {
    func setupView() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let nib = UINib(nibName: "HomeMemoryItemCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "HomeMemoryItemCell")
        
        //        collectionView.delegate = self
        //        collectionView.dataSource = self
        //        let layout = CustomCollectionViewFlowLayout()
        //        layout.setupLayout(defaultItemSize: .init(width: view.frame.width / 3, height: 141))
        //        collectionView
        //            .setCollectionViewLayout(layout, animated: true)
    }
}

// MARK: Public
extension HomeViewController {}

// MARK: - Display Logic
extension HomeViewController: HomeDisplayLogic {}

// MARK: - Actions
extension HomeViewController {}
// MARK: - Appearance
extension HomeViewController {
    func setColor() {}
    
    func setFont() {}
}
