//
//  StorageManager.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation
import CoreData

protocol StorageManagerProtocol {
    func isFirstTimeUserOpenApp() -> Bool
    func saveMemory(memory: CDMemory) throws
    func retriveMemoryBasedOnLocation(latitude: Double, longitude: Double) throws -> CDMemory?
    func updateMemory(memory: CDMemory) throws
    func deleteMemory(memory: CDMemory)
}

/* The main purpos of using actor instead of class is being safe when we want to read and write from different Tasks */
actor StorageManager {
    
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
    
    let userDefaultManager: UserDefaultsManager
    let persistanceManager: PersistanceManager
    
    init(userDefaultManager: UserDefaultsManager, persistanceManager: PersistanceManager) {
        self.userDefaultManager = userDefaultManager
        self.persistanceManager = persistanceManager
    }
    
    func isFirstTimeUserOpenApp() -> Bool {
        userDefaultManager.getIsTheFirstTimeStatus()
    }
    
    func saveMemory(memory: CDMemory) throws {
        try CDMemory.save(memory)
    }
    
    func retriveMemoryBasedOnLocation(latitude: Double, longitude: Double) throws -> CDMemory? {
        let fetchRequest: NSFetchRequest<CDMemory> = CDMemory.fetchRequest()
        let predicate = NSPredicate(format: "latitude == %@ AND longitude == %@",
                                    argumentArray: [latitude, longitude])
        fetchRequest.predicate = predicate
        return try persistanceManager.context.fetch(fetchRequest).first
    }
   
    func updateMemory(memory: CDMemory) throws {
        try CDMemory.update(memory)
    }
    
    func deleteMemory(memory: CDMemory) {
        CDMemory.delete(memory)
    }
}
