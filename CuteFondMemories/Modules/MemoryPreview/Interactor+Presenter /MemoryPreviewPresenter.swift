//
//  MemoryPreviewPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 08/07/2024.
//

import UIKit

@MainActor
protocol MemoryPreviewPresentationLogic: ObservableObject {
    var viewModel: MemoryPreview.ViewModel { get }
}

protocol MemoryPreviewPresenterProtocol {
    func presentPrefilledData(response: MemoryPreview.PrefilledData.Response)
}

final class MemoryPreviewPresenter {
    
    // MARK: - Object lifecycle
    init(viewModel: MemoryPreview.ViewModel = MemoryPreview.ViewModel(),
         logger: DefaultLoggerProtocol = Logger()) {
        self.viewModel = viewModel
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
    }

    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: - Private
    @Published private(set) var viewModel: MemoryPreview.ViewModel
    private(set) var logger: DefaultLoggerProtocol
    
    // MARK: Public
}

// MARK: - Methods

// MARK: Private
private extension MemoryPreviewPresenter {}

// MARK: Public
extension MemoryPreviewPresenter: MemoryPreviewPresenterProtocol {
    func presentPrefilledData(response: MemoryPreview.PrefilledData.Response) {
        Task { @MainActor in
            viewModel.title = response.title
            viewModel.description = response.description
            viewModel.image = response.image
            viewModel.date = response.date
        }
    }
}

// MARK: - Presentation Logic
extension MemoryPreviewPresenter: MemoryPreviewPresentationLogic {}
