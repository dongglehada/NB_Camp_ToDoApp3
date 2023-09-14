//
//  DataManager.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//

import Foundation
import CoreData

class DataManager{
    
    static var shared = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            print("done")
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
    
    private init(){
        
    }
}
