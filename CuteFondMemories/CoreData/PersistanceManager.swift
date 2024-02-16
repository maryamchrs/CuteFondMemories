//
//  PersistanceManager.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 16/02/2024.
//

import Foundation
import CoreData

/*
 To ensure our database remains secure, it is crucial that only one instance can access it.
 Therefore, we must use the Singleton design pattern.
 */
struct PersistanceManager {
    
    static let shared = PersistanceManager()
    let container: NSPersistentContainer
    
    private init(inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: "CuteFondMemories")
        /*
         That is exactly what you want for a persistent store that is in memory only.
         It ensures that nothing will actually be persisted and each time you run the app in the simulator it will start with a fresh store.
         */
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "dev/null")
        }
        
        container.loadPersistentStores { description, error in
            
            if let error = error as? NSError {
                Logger.log(text: "error: \(error)")
            }
            
        }
    }
}
