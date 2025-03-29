//
//  CustomButton.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 30/08/2024.
//

import UIKit

final class CustomButton: UIButton {
    
    struct DataModel {
        
        enum Style {
            case normal
            case destructive
        }
        
        var style: Style
        let title: String
    }
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Properties
    // MARK: Publics
    var titleText: String? {
        didSet {
            setTitle(titleText, for: .normal)
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            updateStyle()
        }
    }
    // MARK: Privates
    private var style: DataModel.Style = .normal {
        didSet {
            updateStyle()
        }
    }
}

// MARK: - Methods
// MARK: Public Methods
extension CustomButton {
    func setDataModel(_ model: DataModel) {
        style = model.style
        titleText = model.title
    }
}

// MARK: Public Methods
private extension CustomButton {
    func commonInit() {
        configuration = nil
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    func updateStyle() {
        switch style {
        case .normal:
            backgroundColor = isEnabled ? .blueOne.withAlphaComponent(1.0) : .blueOne.withAlphaComponent(0.2)
            self.setTitleColor(.white, for: .normal)
            tintColor = .white
        case .destructive:
            backgroundColor = .milky
            self.setTitleColor(.orangeOne, for: .normal)
            tintColor = .orangeOne
            layer.borderWidth = 1
            layer.borderColor = UIColor.orangeOne.cgColor
        }
    }
}

// MARK: - Appearance

extension CustomButton {
    func setColor() {}
    
    func setFont() {
        titleLabel?.font = .customFont(font: .montserrat,
                                       style: .regular,
                                       size: .h3)
    }
}
