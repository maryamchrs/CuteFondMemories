//
//  MemoryDetailsRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 13/02/2024.
//

import UIKit

protocol MemoryDetailsDataPassing: AnyObject {
    var dataStore: MemoryDetailsDataStore? { get }
}

protocol MemoryDetailsRoutingLogic: MemoryDetailsDataPassing {
    var viewController: MemoryDetailsViewController? { get set }
    var dataStore: MemoryDetailsDataStore? { get set }
    
    func dismiss()
    func presentImagePicker(_ imagePicker: UIImagePickerController)
    func dismissImagePickerView()
}

final class MemoryDetailsRouter {
    // MARK: - Object lifecycle
    init(logger: DefaultLoggerProtocol = Logger()) {
        self.logger = logger
        self.logger.logInit(String(describing: type(of: self)))
    }
    
    // MARK: - Deinit
    deinit {
        logger.logDeinit(String(describing: type(of: self)))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: MemoryDetailsViewController?
    var dataStore: MemoryDetailsDataStore?
    weak var imagePickerViewController: UIImagePickerController?
    weak var factory: MemoryDetailsFactory?
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
