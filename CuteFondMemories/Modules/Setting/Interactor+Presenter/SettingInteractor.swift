//
//  SettingInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import UIKit

protocol SettingBusinessLogic {
    //    func doSomething(request: Setting.Something.Request)
}

protocol SettingDataStore {}

class SettingInteractor: SettingDataStore {
    // MARK: - Object lifecycle
    init() {
        SettingLogger.logInit(owner: String(describing: SettingInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        SettingLogger.logDeinit(owner: String(describing: SettingInteractor.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var presenter: SettingPresentationLogic?
    var worker: SettingWorkerLogic?
}

// MARK: - Methods
// MARK: Public
extension SettingInteractor {}

// MARK: Private
private extension SettingInteractor {}

// MARK: - Business Logics
extension SettingInteractor: SettingBusinessLogic {}
