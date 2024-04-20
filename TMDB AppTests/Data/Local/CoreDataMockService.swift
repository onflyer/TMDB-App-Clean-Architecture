//
//  TestCoreDataStack.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/20/24.
//

import Foundation
import CoreData
@testable import TMDB_App

class CoreDataMockService: CoreDataService {
    
    override init() {
        super.init()
        
        let container = NSPersistentContainer(name: CoreDataService.modelName,
                                              managedObjectModel: CoreDataService.model)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        self.storeContainer = container
    }
}
