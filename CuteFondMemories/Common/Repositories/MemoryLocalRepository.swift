//
//  MemoryLocalRepository.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 30/08/2024.
//

import Foundation
import CoreData

protocol MemoryLocalRepositoryProtocol {
    func saveMemory(title: String,
                    descriptionOfMemory: String,
                    date: Date?,
                    image: Data?,
                    latitude: Double,
                    longitude: Double) async throws
    func retrieveMemoryBasedOnLocation(latitude: Double, longitude: Double) async throws -> Memory?
    func fetchMemories() async throws -> [Memory]
    func updateMemory(memory: Memory) async throws
    func deleteMemory(memory: Memory) async throws
}

extension MemoryLocalRepositoryProtocol {
    func saveMemory(title: String,
                    descriptionOfMemory: String,
                    date: Date? = nil,
                    image: Data? = nil,
                    latitude: Double,
                    longitude: Double) async throws {
        try await saveMemory(
            title: title,
            descriptionOfMemory: descriptionOfMemory,
            date: date,
            image: image,
            latitude: latitude,
            longitude: longitude
        )
    }
}

final class MemoryLocalRepository: MemoryLocalRepositoryProtocol {
    
    private(set) var persistenceManager: PersistenceManagerProtocol
    
    init(persistenceManager: PersistenceManagerProtocol) {
        self.persistenceManager = persistenceManager
    }
    
    func saveMemory(title: String,
                    descriptionOfMemory: String,
                    date: Date? = nil,
                    image: Data? = nil,
                    latitude: Double,
                    longitude: Double) throws {
        let memory = Memory(title: title,
                            descriptionOfMemory: descriptionOfMemory,
                            date: date,
                            image: image,
                            latitude: latitude,
                            longitude: longitude,
                            context: persistenceManager.context)
        try Memory.save(memory)
    }
    
    func fetchMemories() async throws -> [Memory] {
        let fetchRequest: NSFetchRequest<Memory> = Memory.fetchRequest()
        let sort = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        return try persistenceManager.context.fetch(fetchRequest)
    }
    
    func retrieveMemoryBasedOnLocation(latitude: Double, longitude: Double) throws -> Memory? {
        let fetchRequest: NSFetchRequest<Memory> = Memory.fetchRequest()
        let predicate = NSPredicate(format: "latitude == %@ AND longitude == %@",
                                    argumentArray: [latitude, longitude])
        fetchRequest.predicate = predicate
        return try persistenceManager.context.fetch(fetchRequest).first
    }
    
    func updateMemory(memory: Memory) throws {
        try Memory.update(memory)
    }
    
    func deleteMemory(memory: Memory) throws {
        try Memory.delete(memory)
    }
}
