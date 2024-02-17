//
//  CDMemory+Helper.swift
//  CuteFondMemories
//
//  Created by Maryam Chrs on 16/02/2024.
//

import Foundation
import CoreData
 
extension CDMemory {
    
    convenience init(title: String, 
                     desctiprionOfMemory: String,
                     date: Date?,
                     image: Data?,
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
    
    static func save(_ memory: CDMemory) throws {
        guard let context = memory.managedObjectContext else { return }
        try context.save()
    }
    
    static func update(_ memory: CDMemory) throws {
        guard let context = memory.managedObjectContext else { return }
        try context.save()
    }
    
    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<CDMemory> {
        let request = CDMemory.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = predicate
        return request
    }
    
    static func delete(_ memory: CDMemory) {
        guard let context = memory.managedObjectContext else { return }
        context.delete(memory)
    }
}
