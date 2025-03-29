//
//  MemoryPreviewFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 08/07/2024.
//

import Foundation

protocol MemoryPreviewViewFactoryProtocol {
    @MainActor func makeMemoryPreviewView(memory: Memory?,
                                          latitude: Double,
                                          longitude: Double) -> MemoryPreviewView<MemoryPreviewPresenter>
}

final class MemoryPreviewFactory: DependencyContainer, MemoryPreviewViewFactoryProtocol {
    
    @MainActor func makeMemoryPreviewView(memory: Memory?,
                                          latitude: Double,
                                          longitude: Double) -> MemoryPreviewView<MemoryPreviewPresenter> {
        let presenter = MemoryPreviewPresenter()
        let worker = MemoryPreviewWorker()
        let interactor = MemoryPreviewInteractor(presenter: presenter,
                                                 worker: worker)
        interactor.memory = memory
        interactor.latitude = latitude
        interactor.longitude = longitude
        return MemoryPreviewView(interactor: interactor, presenter: presenter)
    }
}
