//
//  TabbarItemModel.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 28/08/2024.
//

import Foundation

enum TabbarItem {
    case home
    case addMemory
    case setting
    
    var title: String {
        switch self {
        case .home:
            "Home"
        case .addMemory:
            "Add Memory"
        case .setting:
            "Setting"
        }
    }
    
    var tag: Int {
        switch self {
        case .home:
            0
        case .addMemory:
            1
        case .setting:
            2
        }
    }
    
    var imageName: String {
        switch self {
        case .home:
            "Home"
        case .addMemory:
            "AddMemory"
        case .setting:
            "Setting"
        }
    }
}

