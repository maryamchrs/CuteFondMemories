//
//  UIViewControllerExtension.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 29/02/2024.
//

import UIKit

extension UIViewController {

    func showAlert(_ title: String?,
                   message: String?,
                   actions: [String: UIAlertAction.Style] = [:],
                   handler: ((UIAlertAction) -> Void)? = nil,
                   textFields: [((UITextField) -> Void)] = []) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let actions = actions.isEmpty ? ["Okay": UIAlertAction.Style.default] : actions

        // Add actions to the alert
        for (title, style) in actions {
            alert.addAction(UIAlertAction(title: title, style: style, handler: handler))
        }
        
        for textField in textFields {
            alert.addTextField(configurationHandler: textField)
        }
        
        present(alert, animated: true)
    }
}
