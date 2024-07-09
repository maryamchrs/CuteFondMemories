//
//  MemoryPreviewPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 08/07/2024.
//

import UIKit

@MainActor
protocol MemoryPreviewPresentationLogic: ObservableObject {
    var viewModel: MemoryPreview.ViewModel { get }
}

@MainActor
final class MemoryPreviewPresenter {
    // MARK: - Object lifecycle
    
    // MARK: - Deinit
    deinit {
        Logger.logDeinit(owner: String(describing: MemoryPreviewPresenter.self))
    }
    
    // MARK: - Properties
    
    // MARK: - Private
    @Published private(set) var viewModel = MemoryPreview.ViewModel()
    
    // MARK: Public
}

// MARK: - Methods

// MARK: Private
private extension MemoryPreviewPresenter {}

// MARK: Public
extension MemoryPreviewPresenter {
    func presenPrefilledData(response: MemoryPreview.PrefilledData.Response) {
        viewModel.title = response.title
        viewModel.description = response.description
        viewModel.image = response.image
        viewModel.date = response.date
    }
}

// MARK: - Presentation Logic
extension MemoryPreviewPresenter: MemoryPreviewPresentationLogic {}
