//
//  ViewDidLoadModifier.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 10/07/2024.
//

import Foundation
import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    
    @State private var viewDidLoad = false
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}
