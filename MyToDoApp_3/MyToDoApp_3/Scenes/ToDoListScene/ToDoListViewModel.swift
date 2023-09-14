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
        return coreDataManager.getToDoListFromCoreData()
    }
    
    func updateToDoCompletedToggle(task: Task){
        coreDataManager.updateCompleted(task: task) {
            self.viewUpdate()
        }
    }
    
    func addToDo(title: String){
        coreDataManager.saveToDoData(title: title) {
            self.viewUpdate()
        }
    }

    func deleteToDo(task:Task){
        coreDataManager.deleteToDo(task: task) {
            self.viewUpdate()
        }
    }
    func updateToDoTitle(task:Task, title:String){
        coreDataManager.updateToDo(task: task, title: title) {
            self.viewUpdate()
        }
    }
}
