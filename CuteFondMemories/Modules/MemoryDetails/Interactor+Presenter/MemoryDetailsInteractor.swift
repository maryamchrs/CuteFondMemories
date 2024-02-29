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
    func oneImageSelected(request: MemoryDetails.ChosenImage.Request)
    func oneActionOnAlertViewSelected(request: MemoryDetails.ActionOnAlertView.Request)
}

protocol MemoryDetailsDataStore {
    var memory: Memory? { get set }
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
    
    var state: MemoryDetails.State {
        return memory != nil ? .edit : .add
    }
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var memory: Memory?
    
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
                if let memory {
                    let response = MemoryDetails.PrefilledData.Response(title: memory.title,
                                                                        description: memory.descriptionOfMemory,
                                                                        date: memory.date,
                                                                        image: UIImage(data: memory.image ?? Data()))
                   await presenter.presenPrefilledData(response: response)
                }
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
                    
                    await presenter?.presentActionSuccess(response: MemoryDetails.ActionWasSuccessful.Response())
                    
                case .edit:
                    Logger.log(text: "Update this memory to the core data")
                    guard let memory else { return }
                    memory.title = title
                    memory.descriptionOfMemory = desctiprionOfMemory
                    memory.date = selectedDate ?? memory.date
                    memory.image = request.image?.jpegData(compressionQuality: 1)
                    try await fileWorker?.updateMemory(memory: memory)
                    
                    await presenter?.presentActionSuccess(response: MemoryDetails.ActionWasSuccessful.Response())
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
    
    func oneImageSelected(request: MemoryDetails.ChosenImage.Request) {
        Task {
            guard let fileWorker, let presenter, let selectedImage = request.selectedImage else { return }
            let imageData = selectedImage.jpegData(compressionQuality: 1)
    
            await presenter.presentChosenImage(response: MemoryDetails.ChosenImage.Response(imageData: imageData))
            if let memory {
                memory.image = imageData
                try? await fileWorker.updateMemory(memory: memory)
            }
        }
    }
    
    func oneActionOnAlertViewSelected(request: MemoryDetails.ActionOnAlertView.Request) {
        Task {
            guard let type = await MemoryDetails.ImageType(rawValue: request.action.title ?? "" ) else { return }
            await presenter?.presentPickerImageView(response: MemoryDetails.PickerImageSetup.Response(type: type))
        }
    }
}
