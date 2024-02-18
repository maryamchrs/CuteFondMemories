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
    private let persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    // An initializer to load Core Data, optionally able to use an in-memory store.
    /*
     The in-memory store part of that code is important, because when you configure Core Data to save information into memory rather than disk it means all the changes you make get thrown away when your program ends.
     */
    private init(inMemory: Bool = false) {
        self.persistentContainer = NSPersistentContainer(name: "CuteFondMemories")
        /*
         That is exactly what you want for a persistent store that is in memory only.
         It ensures that nothing will actually be persisted and each time you run the app in the simulator it will start with a fresh store.
         */
        if inMemory {
            persistentContainer.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "dev/null")
        }
        
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
        }
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
