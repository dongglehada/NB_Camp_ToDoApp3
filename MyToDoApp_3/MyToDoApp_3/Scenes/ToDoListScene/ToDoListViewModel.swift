//
//  ToDoListViewModel.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//

import Foundation


final class TodoListViewModel{
    
    var viewUpdate : () -> Void = {}
    
    private var coreDataManager = CoreDataManager.shared
    
    lazy var taskList = self.coreDataManager.getToDoListFromCoreData(){
        didSet{
            viewUpdate()
        }
    }
    private func taskListUpdate(){
        self.taskList = self.coreDataManager.getToDoListFromCoreData()
    }
    
    func updateToDoCompletedToggle(task: Task){
        coreDataManager.updateCompleted(task: task) {
            self.taskListUpdate()
        }
    }
    
    func addToDo(title: String){
        coreDataManager.saveToDoData(title: title) {
            self.taskListUpdate()
        }
    }

    func deleteToDo(task:Task){
        coreDataManager.deleteToDo(task: task) {
            self.taskListUpdate()
        }
    }
    func updateToDoTitle(task:Task, title:String){
        coreDataManager.updateToDo(task: task, title: title) {
            self.taskListUpdate()
        }
    }
}
