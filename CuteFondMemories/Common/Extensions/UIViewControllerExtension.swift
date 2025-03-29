//
//  UIViewControllerExtension.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 29/02/2024.
//

import UIKit

extension UIViewController: NibLoadable {}

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
    
    func showToast(message: String, seconds: Double) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
    func showToast(message: String, color: UIColor) {
        DispatchQueue.main.async {
            let toastLbl = UILabel(frame: CGRect(x: 20, 
                                                 y: self.view.frame.size.height - 100,
                                                 width: self.view.frame.width - 40,
                                                 height: 30))
            toastLbl.layer.cornerRadius = 8;
            toastLbl.clipsToBounds  =  true
            toastLbl.textColor = .white
            toastLbl.font = .systemFont(ofSize: 15)
            toastLbl.textAlignment = .center
            toastLbl.text = message
            self.view.addSubview(toastLbl)
            toastLbl.backgroundColor = color
            UIView.animate(withDuration: 2.0,
                           delay: 0,
                           options: .transitionCurlDown,
                           animations: {},
                           completion: { isCompleted in
                toastLbl.removeFromSuperview()
            })
        }
    }
    
    func addCustomBackButton(image: UIImage? = nil,
                             direction: direction = .left,
                             size: CGSize = CGSize(width: 24, height: 70),
                             action: Selector? = nil) {
        let backButton = UIButton(type: .custom)
        let backImage = UIImage(systemName: "arrow.backward")
        backButton.setImage(image ?? backImage, for: .normal)
        backButton.frame = CGRect(origin: .zero, size: size)
        backButton.tintColor = .black
        backButton.addTarget(self, action: action ?? #selector(goBack), for: .touchUpInside)
        let backButtonItem = UIBarButtonItem(customView: backButton)
        switch direction {
        case .left:
           self.navigationItem.leftBarButtonItem = backButtonItem
        case .right:
           self.navigationItem.rightBarButtonItem = backButtonItem
        }
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    enum direction {
        case right
        case left
    }
}
