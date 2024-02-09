//
//  StorageManager.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation

protocol StorageManagerProtocol {
    
}

/* The main purpos of using actor instead of class is being safe when we want to read and write from different Tasks */
actor StorageManager {
    /*
     For the sake of our requirement I save some of the necessary data in memory and others in UserDefualt
     This StorageManager responsibel to deside about the place to save data.
     */
    let userDefaultManager: UserDefaultsManager
    
    init(userDefaultManager: UserDefaultsManager) {
        self.userDefaultManager = userDefaultManager
    }
    
    func isFirstTimeUserOpenApp() -> Bool {
        userDefaultManager.getIsTheFirstTimeStatus()
    }
}
