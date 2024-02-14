//
//  DashboardPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import UIKit

protocol DashboardPresentationLogic {
    func presentSelectedPlace(response: Dashboard.AddingAnnotaion.Response) async
    func presentMemoryDetailsScene(response: Dashboard.MemoryDetailsScene.Response) async
}

class DashboardPresenter {
    // MARK: - Object lifecycle
    init() {
        DashboardLogger.logInit(owner: String(describing: DashboardPresenter.self))
    }
    
    // MARK: - Deinit
    deinit {
        DashboardLogger.logDeinit(owner: String(describing: DashboardPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: DashboardDisplayLogic?
}

// MARK: - Methods

// MARK: Private
private extension DashboardPresenter {}

// MARK: Public
extension DashboardPresenter {}

// MARK: - Presentation Logic
extension DashboardPresenter: DashboardPresentationLogic {
    func presentSelectedPlace(response: Dashboard.AddingAnnotaion.Response) async {
        let viewModel = Dashboard.AddingAnnotaion.ViewModel(annotaions: [response.selectedLocation])
        await viewController?.displayAnnotations(viewModel: viewModel)
    }
    
    func presentMemoryDetailsScene(response: Dashboard.MemoryDetailsScene.Response) async {
        let viewModel = Dashboard.MemoryDetailsScene.ViewModel()
        await viewController?.displayMemoryDetailsScene(viewModel: viewModel)
    }
}
