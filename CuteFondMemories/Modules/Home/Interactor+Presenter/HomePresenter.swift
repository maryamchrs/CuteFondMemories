//
//  HomePresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import UIKit

protocol HomePresentationLogic: AnyObject {
    var viewController: HomeDisplayLogic? { get set }
    // func presentSomething(response: Home.Something.Response) async
}

final class HomePresenter: Loggable {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: HomeDisplayLogic?
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods
// MARK: Public
extension HomePresenter {}

// MARK: Private
private extension HomePresenter {}

// MARK: - Presentation Logic
extension HomePresenter: HomePresentationLogic {}
