//
//  MemoryPreviewFactory.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 08/07/2024.
//

import Foundation

protocol MemoryPreviewViewFactory {
    func makeMemoryPreviewView() -> MemoryPreviewView<MemoryPreviewPresenter>
}

protocol MemoryPreviewServiceFactory {
    func makeMemoryPreviewService() -> MemoryPreviewService
}

final class MemoryPreviewFactory: DependencyContainer {
    
    @MainActor func makeMemoryPreviewView(memory: Memory?,
                                          latitude: Double,
                                          longitude: Double) -> MemoryPreviewView<MemoryPreviewPresenter> {
        let interactor = MemoryPreviewInteractor()
        interactor.memory = memory
        interactor.latitude = latitude
        interactor.longitude = longitude
        let presenter = MemoryPreviewPresenter()
        let worker = MemoryPreviewWorker(service: makeMemoryPreviewService())
        interactor.presenter = presenter
        interactor.worker = worker
        return MemoryPreviewView(interactor: interactor, presenter: presenter)
    }
}

private extension MemoryPreviewFactory {
    func makeMemoryPreviewService() -> MemoryPreviewService {
        return MemoryPreviewService(httpClient: URLSession.shared)
    }
}
