//
//  ViewExtension.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 10/07/2024.
//

import Foundation
import SwiftUI

extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
