//
//  MemoryDetailsPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

protocol MemoryDetailsPresentationLogic {
    func presentMainButtonTitle(response: MemoryDetails.MainButtonTitle.Response) async
}

final class MemoryDetailsPresenter {
    // MARK: - Object lifecycle
    init() {
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsPresenter.self))
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: MemoryDetailsDisplayLogic?
}

// MARK: - Methods
// MARK: Public
extension MemoryDetailsPresenter {}

// MARK: Private
private extension MemoryDetailsPresenter {}

// MARK: - Presentation Logic
extension MemoryDetailsPresenter: MemoryDetailsPresentationLogic {
    func presentMainButtonTitle(response: MemoryDetails.MainButtonTitle.Response) async {
        let viewModel = MemoryDetails.MainButtonTitle.ViewModel(title: response.state.buttonTitle)
        await viewController?.displayMainButtonTitle(viewModel: viewModel)
    }
}
