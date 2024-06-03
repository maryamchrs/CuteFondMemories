//
//  SettingPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 03/06/2024.
//

import UIKit

protocol SettingPresentationLogic {
    //    func presentSomething(response: Setting.Something.Response) async
}

class SettingPresenter {
    // MARK: - Object lifecycle
    init() {
        SettingLogger.logInit(owner: String(describing: SettingPresenter.self))
    }
    
    // MARK: - Deinit
    deinit {
        SettingLogger.logDeinit(owner: String(describing: SettingPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: SettingDisplayLogic?
}

// MARK: - Methods
// MARK: Public
extension SettingPresenter {}

// MARK: Private
private extension SettingPresenter {}

// MARK: - Presentation Logic
extension SettingPresenter: SettingPresentationLogic {}
