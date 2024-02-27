//
//  MemoryDetailsRouter.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 13/02/2024.
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

final class MemoryDetailsRouter: NSObject, MemoryDetailsDataPassing {
    // MARK: - Object lifecycle
    override init() {
        MemoryDetailsLogger.logInit(owner: String(describing: MemoryDetailsRouter.self))
    }
    
    // MARK: - Deinit
    deinit {
        MemoryDetailsLogger.logDeinit(owner: String(describing: MemoryDetailsRouter.self))
    }
    
    // MARK: - Properties
    
    // MARK: Public
    weak var viewController: MemoryDetailsViewController?
    weak var umagePickerViewController: UIImagePickerController?
    weak var factory: MemoryDetailsFactory?
    var dataStore: MemoryDetailsDataStore?
    
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
        umagePickerViewController = imagePicker
        if let umagePickerViewController {
            viewController?.present(imagePicker, animated: false, completion: nil)
        }
    }
    
    func dismissImagePickerView() {
        umagePickerViewController?.dismiss(animated: true)
        umagePickerViewController = nil
    }
}
