//
//  MemoryDetailsRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 13/02/2024.
//

import UIKit

protocol MemoryDetailsRoutingLogic {
    func dismiss()
    func presentImagePicker(_ imagePicker: UIImagePickerController)
    func dismissImagePickerView()
}

protocol MemoryDetailsDataPassing {
    var dataStore: MemoryDetailsDataStore? { get }
}

final class MemoryDetailsRouter: NSObject, MemoryDetailsDataPassing, Loggable {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        super.init()
        logInit()
    }
    
    // MARK: - Deinit
    deinit {
        logDeinit()
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: MemoryDetailsViewController?
    weak var imagePickerViewController: UIImagePickerController?
    weak var factory: MemoryDetailsFactory?
    var dataStore: MemoryDetailsDataStore?
    private(set) var logger: DefaultLoggerProtocol
    
}

// MARK: - Methods
// MARK: Public
extension MemoryDetailsRouter {}

// MARK: Private
private extension MemoryDetailsRouter {}

// MARK: - Routing Logic
extension MemoryDetailsRouter: MemoryDetailsRoutingLogic {
    func dismiss() {
        viewController?.dismiss(animated: true)
    }
    
    func presentImagePicker(_ imagePicker: UIImagePickerController) {
        imagePickerViewController = imagePicker
        if imagePickerViewController != nil {
            viewController?.present(imagePicker, animated: false, completion: nil)
        }
    }
    
    func dismissImagePickerView() {
        imagePickerViewController?.dismiss(animated: true)
        imagePickerViewController = nil
    }
}
