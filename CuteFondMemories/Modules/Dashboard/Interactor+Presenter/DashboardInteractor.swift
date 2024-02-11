//
//  DashboardInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import UIKit

protocol DashboardBusinessLogic {
    //    func doSomething(request: Dashboard.Something.Request)
}

protocol DashboardDataStore {}

class DashboardInteractor: DashboardDataStore {
    // MARK: - Object lifecycle
    init() {
        DashboardLogger.logInit(owner: String(describing: DashboardInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        DashboardLogger.logDeinit(owner: String(describing: DashboardInteractor.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var presenter: DashboardPresentationLogic?
    var worker: DashboardWorkerLogic?
}

// MARK: - Methods
// MARK: Public
extension DashboardInteractor {}

// MARK: Private
private extension DashboardInteractor {}
// MARK: - Business Logics
extension DashboardInteractor: DashboardBusinessLogic {}
