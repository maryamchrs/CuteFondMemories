//
//  TabbarItemModel.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 28/08/2024.
//

import Foundation

enum TabbarItem {
    case home
    case addMemory
    case setting
    
    var title: String {
        switch self {
        case .home:
            "home_tabBar_title".localize
        case .addMemory:
            "add_memory_tabBar_title".localize
        case .setting:
            "setting_tabBar_title".localize
        }
    }
    
    var tag: Int {
        switch self {
        case .home: 0
        case .addMemory: 1
        case .setting: 2
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

