//
//  StorageManager.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 09/02/2024.
//

import Foundation
import CoreData

protocol StorageManagerProtocol {
    func isFirstTimeUserOpenApp() async -> Bool
    func saveMemory(title: String,
                    desctiprionOfMemory: String,
                    date: Date?,
                    image: Data?,
                    latitude: Double,
                    longitude: Double) async throws
    func retriveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory?
    func fetchMemories() async throws -> [Memory]
    func updateMemory(memory: Memory) async throws
    func deleteMemory(memory: Memory) async throws
}

extension StorageManagerProtocol {
    func saveMemory(title: String,
                    desctiprionOfMemory: String,
                    date: Date? = nil,
                    image: Data? = nil,
                    latitude: Double,
                    longitude: Double) async throws {
        try await saveMemory(title: title, desctiprionOfMemory: desctiprionOfMemory, date: date, image: image, latitude: latitude, longitude: longitude)
    }
}

/* The main purpos of using actor instead of class is being safe when we want to read and write from different Tasks */
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
    
    let userDefaultManager: UserDefaultsManager
    let persistanceManager: PersistanceManager
    
    init(userDefaultManager: UserDefaultsManager, persistanceManager: PersistanceManager) {
        self.userDefaultManager = userDefaultManager
        self.persistanceManager = persistanceManager
    }
    
    func isFirstTimeUserOpenApp() -> Bool {
        userDefaultManager.getIsTheFirstTimeStatus()
    }
    
    func saveMemory(title: String,
                    desctiprionOfMemory: String,
                    date: Date? = nil,
                    image: Data? = nil,
                    latitude: Double,
                    longitude: Double) throws {
        let memory = Memory(title: title,
                              desctiprionOfMemory: desctiprionOfMemory,
                              date: date,
                              image: image,
                              latitude: latitude,
                              longitude: longitude,
                              context: persistanceManager.context)
        try Memory.save(memory)
    }
    
    func fetchMemories() async throws -> [Memory] {
        let fetchRequest: NSFetchRequest<Memory> = Memory.fetchRequest()
        let sort = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        return try persistanceManager.context.fetch(fetchRequest)
    }
    
    func retriveMemoryBasedOnLocation(latitude: Double, longitude: Double) throws -> Memory? {
        let fetchRequest: NSFetchRequest<Memory> = Memory.fetchRequest()
        let predicate = NSPredicate(format: "latitude == %@ AND longitude == %@",
                                    argumentArray: [latitude, longitude])
        fetchRequest.predicate = predicate
        return try persistanceManager.context.fetch(fetchRequest).first
    }
   
    func updateMemory(memory: Memory) throws {
        try Memory.update(memory)
    }
    
    func deleteMemory(memory: Memory) throws {
        try Memory.delete(memory)
    }
}
