//
//  CDMemory+Helper.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 16/02/2024.
//

import Foundation
import CoreData
 
extension Memory {
    
    convenience init(title: String,
                     desctiprionOfMemory: String,
                     date: Date? = nil,
                     image: Data? = nil,
                     latitude: Double,
                     longitude: Double,
                     context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.descriptionOfMemory = desctiprionOfMemory
        self.date = date
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
    }
    
    static func save(_ memory: Memory) throws {
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
