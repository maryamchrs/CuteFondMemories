//
//  HomeInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/09/2024.
//

import UIKit

protocol HomeBusinessLogic: HomeDataStore, AnyObject  {
    // func doSomething(request: Home.Something.Request)
}

protocol HomeDataStore {}

final class HomeInteractor: HomeDataStore, Loggable {
    // MARK: - Object lifecycle
    init(
        presenter: HomePresentationLogic?,
        worker: HomeWorkerLogic?,
        logger: DefaultLoggerProtocol = Logger()
    ) {
        self.presenter = presenter
        self.worker = worker
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    private(set) var presenter: HomePresentationLogic?
    private(set) var worker: HomeWorkerLogic?
    private(set) var logger: DefaultLoggerProtocol
}

// MARK: - Methods
// MARK: Public
extension HomeInteractor {}

// MARK: Private
private extension HomeInteractor {}

// MARK: - Business Logics
extension HomeInteractor: HomeBusinessLogic {}
