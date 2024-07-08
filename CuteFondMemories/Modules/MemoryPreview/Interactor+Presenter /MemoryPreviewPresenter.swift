//
//  MemoryPreviewPresenter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 08/07/2024.
//

import UIKit

protocol MemoryPreviewPresentationLogic: ObservableObject {
    var viewModel: MemoryPreview.ViewModel { get }
}

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
extension MemoryPreviewPresenter {}

// MARK: - Presentation Logic
extension MemoryPreviewPresenter: MemoryPreviewPresentationLogic {}
