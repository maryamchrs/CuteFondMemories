//
//  MemoryDetailsPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 13/02/2024.
//

import UIKit

protocol MemoryDetailsPresentationLogic: AnyObject {
    var viewController: MemoryDetailsDisplayLogic? { get set }
    
    func presentMainButtonTitle(response: MemoryDetails.MainButtonTitle.Response) async
    func presentPrefilledData(response: MemoryDetails.PrefilledData.Response) async
    func presentActionSuccess(response: MemoryDetails.ActionWasSuccessful.Response) async
    func presentChosenImage(response: MemoryDetails.ChosenImage.Response) async
    func presentPickerImageView(response: MemoryDetails.PickerImageSetup.Response) async
    func presentSelectedDate(response: MemoryDetails.DatePicker.Response) async
}

final class MemoryDetailsPresenter {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: MemoryDetailsDisplayLogic?
    private(set) var logger: DefaultLoggerProtocol
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
    
    func presentPrefilledData(response: MemoryDetails.PrefilledData.Response) async {
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
    
    func presentPickerImageView(response: MemoryDetails.PickerImageSetup.Response) async {
        let viewModel = MemoryDetails.PickerImageSetup.ViewModel(type: response.type)
        await viewController?.displayPickerImageView(viewModel: viewModel)
    }
    
    func presentSelectedDate(response: MemoryDetails.DatePicker.Response) async {
        let viewModel = MemoryDetails.DatePicker.ViewModel(selectedDate: response.selectedDate)
        await viewController?.displaySelectedDate(viewModel: viewModel)
    }
}
