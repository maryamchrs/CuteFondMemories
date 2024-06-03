//
//  XibLoadable.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 11/02/2024.
//

import Foundation
import UIKit

protocol NibLoadable {
    associatedtype CustomViewType
    static func loadFromNib() -> CustomViewType
}

extension NibLoadable where Self: UIView {
    
    static func loadFromNib() -> Self {
        let nib = UINib(nibName: "\(self)", bundle: Bundle(for: self))
        guard let customView = nib.instantiate(withOwner: self, options: nil).first as? Self else {
            // your app should crash if the xib doesn't exist
            preconditionFailure("Couldn't load nib for view: \(self)")
        }
        return customView
    }
}

extension NibLoadable where Self: UIViewController {
    static var nibName: String {
        return String(describing: self)
    }

    static var bundle: Bundle {
        return Bundle(for: Self.self)
    }
    
    static func loadFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}

extension NibLoadable where Self: UITabBarController {
    static var nibName: String {
        return String(describing: self)
    }

    static var bundle: Bundle {
        return Bundle(for: Self.self)
    }
    
    static func loadFromNib() -> Self {
        func instanceFromNib<T: UITabBarController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}

