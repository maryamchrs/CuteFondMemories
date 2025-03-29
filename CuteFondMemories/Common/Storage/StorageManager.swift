//
//  StorageManager.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 09/02/2024.
//

import Foundation
import CoreData

protocol StorageManagerProtocol {
    func isFirstTimeUserOpenApp() async -> Bool
}

/* The main purpose of using actor instead of class is being safe when we want to read and write from different Tasks */
actor StorageManager: StorageManagerProtocol {
    
    /*
     TIP:
     Our Storage Manager serves as the central hub for data storage and retrieval, abstracting away complexities.
     It dynamically allocates storage resources based on data sensitivity and context.
     Developers interact with the Storage Manager through simple, predefined methods.
     It intelligently decides where data should be stored, whether in UserDefaults, Keychain, or Core Data.
     Retrieval of stored data is efficient and seamless.
     The Storage Manager shields us from the underlying storage details.
     You can focus on application logic without storage concerns.
     New storage mechanisms can be seamlessly integrated for scalability.
     Overall, the Storage Manager streamlines data management, promoting code simplicity and robustness.
     */
    
    let userDefaultManager: UserDefaultsManagerProtocol
    let persistenceManager: PersistenceManagerProtocol
    
    init(userDefaultManager: UserDefaultsManagerProtocol,
         persistenceManager: PersistenceManagerProtocol) {
        self.userDefaultManager = userDefaultManager
        self.persistenceManager = persistenceManager
    }
    
    func isFirstTimeUserOpenApp() -> Bool {
        userDefaultManager.getIsTheFirstTimeStatus()
    }
}
