//
//  UITextViewExtension.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 14/02/2024.
//

import UIKit

extension UITextView {
    
    func adjustUITextViewHeight() {
        self.sizeToFit()
        self.isScrollEnabled = false
    }
    
    func calculateTextDescription() -> CGSize {
        let fixedWidth = self.frame.size.width
        self.sizeThatFits(CGSize(width: fixedWidth,
                                 height: CGFloat.greatestFiniteMagnitude))
        return self.sizeThatFits(CGSize(width: fixedWidth,
                                        height: CGFloat.greatestFiniteMagnitude))
    }
}
