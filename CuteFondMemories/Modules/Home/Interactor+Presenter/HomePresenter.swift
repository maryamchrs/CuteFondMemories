//
//  HomePresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import UIKit

protocol HomePresentationLogic {
    // func presentSomething(response: Home.Something.Response) async
}

final class HomePresenter {
    // MARK: - Object lifecycle
    init(viewController: HomeDisplayLogic?,
         logger: DefaultLoggerProtocol = Logger()
    ) {
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
        self.viewController = viewController
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    private(set) weak var viewController: HomeDisplayLogic?
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods
// MARK: Public
extension HomePresenter {}

// MARK: Private
private extension HomePresenter {}

// MARK: - Presentation Logic
extension HomePresenter: HomePresentationLogic {}
