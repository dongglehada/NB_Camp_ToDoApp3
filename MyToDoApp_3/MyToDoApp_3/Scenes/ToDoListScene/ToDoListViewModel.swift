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
    
//    lazy var taskList = self.coreDataManager.getToDoListFromCoreData(){
//        didSet{
//            viewUpdate()
//        }
//    }

    func getToDoList() -> [Task]{
        return coreDataManager.getToDoListFromCoreData()
    }
    
//    func taskListUpdate(){
//        self.taskList = self.coreDataManager.getToDoListFromCoreData()
//    }
    
    func updateToDoCompletedToggle(task: Task){
        coreDataManager.updateCompleted(task: task) {
//            self.taskListUpdate()
            self.viewUpdate()
        }
    }
    
    func addToDo(title: String){
        coreDataManager.saveToDoData(title: title) {
//            self.taskListUpdate()
            self.viewUpdate()
        }
    }

    func deleteToDo(task:Task){
        coreDataManager.deleteToDo(task: task) {
//            self.taskListUpdate()
            self.viewUpdate()
        }
    }
    func updateToDoTitle(task:Task, title:String){
        coreDataManager.updateToDo(task: task, title: title) {
//            self.taskListUpdate()
            self.viewUpdate()
        }
    }
}
