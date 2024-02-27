//
//  MemoryDetailsPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

protocol MemoryDetailsPresentationLogic {
    func presentMainButtonTitle(response: MemoryDetails.MainButtonTitle.Response) async
    func presenPrefilledData(response: MemoryDetails.PrefilledData.Response) async
    func presentActionSuccess(response: MemoryDetails.ActionWasSuccessful.Response) async
    func presentChosenImage(response: MemoryDetails.ChosenImage.Response) async
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
    
    func presenPrefilledData(response: MemoryDetails.PrefilledData.Response) async {
        let viewModel = MemoryDetails.PrefilledData.ViewModel(title: response.title, description: response.description, date: response.date, image: response.image)
        await viewController?.displayPrefilledData(viewModel: viewModel)
    }
    
    func presentActionSuccess(response: MemoryDetails.ActionWasSuccessful.Response) async {
        await viewController?.displayActionSuccess(viewModel: MemoryDetails.ActionWasSuccessful.ViewModel())
    }
    
    func presentChosenImage(response: MemoryDetails.ChosenImage.Response) async {
        guard let imageData = response.imageData, let image = UIImage(data: imageData) else { return }
        await viewController?.displayChosenImage(viewModel: MemoryDetails.ChosenImage.ViewModel(selectedImage: image))
    }
}
