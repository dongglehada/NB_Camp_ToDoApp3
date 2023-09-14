//
//  TodoData+CoreDataProperties.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//
//

import Foundation
import CoreData


extension TodoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoData> {
        return NSFetchRequest<TodoData>(entityName: "TodoData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var context: String?
    @NSManaged public var isDone: Bool

}

extension TodoData : Identifiable {

}
