//
//  ToDoListViewModel.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//

import Foundation
import CoreData

final class TodoListViewModel{
    
    var viewUpdate : () -> Void = {}
    
    private var coreDataManager = CoreDataManager.shared

    func getToDoList() -> [Task]{
        print(#function)
        return coreDataManager.getToDoListFromCoreData()
    }
    
    func updateToDoCompletedToggle(task: Task){
        print(#function)
        coreDataManager.updateCompleted(task: task) {
            self.viewUpdate()
        }
    }
    
    func addToDo(title: String){
        print(#function)
        coreDataManager.saveToDoData(title: title) {
            self.viewUpdate()
        }
    }

    func deleteToDo(task:Task){
        print(#function)
        coreDataManager.deleteToDo(task: task) {
            self.viewUpdate()
        }
    }
    
    func updateToDoTitle(task:Task, title:String){
        print(#function)
        coreDataManager.updateToDo(task: task, newTitle: title) {
            self.viewUpdate()
        }
    }
}
