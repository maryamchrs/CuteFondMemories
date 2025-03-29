//
//  MemoryPreviewInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 08/07/2024.
//

import UIKit

protocol MemoryPreviewBusinessLogic {
    func viewDidLoad(request: MemoryPreview.ViewDidLoad.Request)
}

protocol MemoryPreviewDataStore {
    var memory: Memory? { get set }
    var latitude: Double { get set }
    var longitude: Double { get set }
}

final class MemoryPreviewInteractor: MemoryPreviewDataStore, Loggable {
    // MARK: - Object lifecycle
    init(presenter: MemoryPreviewPresenterProtocol?,
         worker: MemoryPreviewWorkerLogic?,
         logger: DefaultLoggerProtocol = Logger()) {
        self.presenter = presenter
        self.worker = worker
        self.logger = logger
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    
    var memory: Memory?
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    // MARK: Private
    private(set) var presenter: MemoryPreviewPresenterProtocol?
    private(set) var worker: MemoryPreviewWorkerLogic?
    private(set) var logger: DefaultLoggerProtocol
    private var viewDidLoadTask: (Task<(), Never>)?
}

// MARK: - Methods

// MARK: Private
private extension MemoryPreviewInteractor {}

// MARK: Public
extension MemoryPreviewInteractor {}

// MARK: - Business Logics
extension MemoryPreviewInteractor: MemoryPreviewBusinessLogic {
    func viewDidLoad(request: MemoryPreview.ViewDidLoad.Request) {
        // If it is found in the core data, display the corresponding information.
        // otherwise change the name of button based on the status
        viewDidLoadTask?.cancel()
        viewDidLoadTask = Task { [weak self] in
            guard let self, let presenter else { return }
            guard let memory else {
                return
            }
            let prefilledDataResponse = MemoryPreview.PrefilledData.Response(title: memory.title,
                                                                             description: memory.descriptionOfMemory,
                                                                             date: memory.date,
                                                                             image: UIImage(data: memory.image ?? Data()))
            await presenter.presentPrefilledData(response: prefilledDataResponse)
        }
    }
}
