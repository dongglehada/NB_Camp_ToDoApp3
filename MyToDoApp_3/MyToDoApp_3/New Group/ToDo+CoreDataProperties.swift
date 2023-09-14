//
//  ToDo+CoreDataProperties.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//
//

import Foundation
import CoreData


extension ToDoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var context: String?
    @NSManaged public var tag: Int16
    @NSManaged public var isDone: Bool

}

extension ToDo : Identifiable {

}
