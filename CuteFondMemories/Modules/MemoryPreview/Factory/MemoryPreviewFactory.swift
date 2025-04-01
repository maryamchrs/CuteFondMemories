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

final class MemoryPreviewFactory: MemoryPreviewViewFactoryProtocol {
    
    private(set) var dependencies: DependencyContainerProtocol
    private(set) var logger: DefaultLoggerProtocol
    
    init(dependencies: DependencyContainerProtocol) {
        self.dependencies = dependencies
        self.logger = dependencies.logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
}

extension MemoryPreviewFactory {
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
