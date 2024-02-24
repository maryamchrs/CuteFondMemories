//
//  MemoryDetailsInteractor.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
//

import UIKit

protocol MemoryDetailsBusinessLogic {
    func viewDidLoad(request: MemoryDetails.ViewDidLoad.Request)
    func mainButtonTapped(request: MemoryDetails.MainButton.Request)
    func datePickerChanged(request: MemoryDetails.DatePicker.Request)
}

protocol MemoryDetailsDataStore {
    var state: MemoryDetails.State { get set }
    var latitude: Double { get set }
    var longitude: Double { get set }
}

final class MemoryDetailsInteractor: MemoryDetailsDataStore {
    // MARK: - Object lifecycle
    init() {
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsInteractor.self))
    }
    
    // MARK: - Deinit
    deinit {
        viewDidLoadTask?.cancel()
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsInteractor.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    var presenter: MemoryDetailsPresentationLogic?
    var worker: MemoryDetailsWorkerLogic?
    var fileWorker: MemoryDetailsFileWorkerLogic?
    var state: MemoryDetails.State = .add
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    // MARK: Private
    private var memories: [Memory] = []
    private var selectedDate: Date?
    
    private var viewDidLoadTask: (Task<(), Never>)?
}

// MARK: - Methods
// MARK: Public
extension MemoryDetailsInteractor {}

// MARK: Private
private extension MemoryDetailsInteractor {}

// MARK: - Business Logics
extension MemoryDetailsInteractor: MemoryDetailsBusinessLogic {
    
    func viewDidLoad(request: MemoryDetails.ViewDidLoad.Request) {
        // TODO: - If user selected this location before show prefield information
        // fetch data based on location
        // if it find in the core data show the informaton
        // otherwise change the name of button based on the status
        viewDidLoadTask?.cancel()
        viewDidLoadTask = Task {
            do {
                guard let fileWorker, let presenter else { return }
                let response = MemoryDetails.MainButtonTitle.Response(state: state)
                await presenter.presentMainButtonTitle(response: response)
                memories = try await fileWorker.fetchMemories()
            } catch {
                print(error)
            }
        }
    }
    
    func mainButtonTapped(request: MemoryDetails.MainButton.Request) {
        Task {
            guard let title = request.title, let desctiprionOfMemory = request.description else {
                //TODO: - Show an error message.
                return
            }
            do {
                switch state {
                case .add:
                    Logger.log(text: "Save this memory to the core data")
                    try await fileWorker?.saveMemory(title: title,
                                                     desctiprionOfMemory: desctiprionOfMemory,
                                                     date: request.date,
                                                     image: nil,
                                                     latitude: latitude,
                                                     longitude: longitude)
                    
                    //TODO: - call delegate -> show annotation on the place.
                    
                case .edit:
                    Logger.log(text: "Update this memory to the core data")
                }
            } catch {
                
            }
        }
    }
    
    func datePickerChanged(request: MemoryDetails.DatePicker.Request) {
        Logger.log(text: "\(request.selectedDate)")
        Logger.log(text: request.selectedDate.withoutTime)
        selectedDate = request.selectedDate
    }
}
