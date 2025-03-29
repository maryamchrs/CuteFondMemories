//
//  CDMemory+Helper.swift
//  CuteFondMemories
//
//  Created by Maryam Chaharsooghi on 16/02/2024.
//

import Foundation
import CoreData
 
protocol MemoryProtocol {
    static func save(_ memory: Memory) throws
    static func update(_ memory: Memory) throws
    static func fetch(_ predicate: NSPredicate) -> NSFetchRequest<Memory>
    static func delete(_ memory: Memory) throws
}

extension Memory: MemoryProtocol {
    
    convenience init(
        title: String,
        descriptionOfMemory: String,
        date: Date? = nil,
        image: Data? = nil,
        latitude: Double,
        longitude: Double,
        context: NSManagedObjectContext
    ) {
        self.init(
            context: context
        )
        self.title = title
        self.descriptionOfMemory = descriptionOfMemory
        self.date = date
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
    }
    
    static func save(
        _ memory: Memory
    ) throws {
        guard let context = memory.managedObjectContext else { return }
        try context.save()
    }
    
    static func update(_ memory: Memory) throws {
        guard let context = memory.managedObjectContext else { return }
        try context.save()
    }
    
    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<Memory> {
        let request = Memory.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    static func delete(_ memory: Memory) throws {
        guard let context = memory.managedObjectContext else { return }
        context.delete(memory)
        try context.save()
    }
}
