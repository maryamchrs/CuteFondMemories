//
//  UIFontExtension.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import UIKit

extension UIFont {
    
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: CustomFontSize,
        isScaled: Bool = true) -> UIFont {
            
            let fontName: String = font.rawValue + style.rawValue
            
            guard let font = UIFont(name: fontName, size: size.rawValue) else {
                debugPrint("Font can't be loaded")
                return UIFont.systemFont(ofSize: size.rawValue)
            }
            
            return isScaled ? UIFontMetrics.default.scaledFont(for: font) : font
        }
}
