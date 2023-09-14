//
//  CompletedToDoListViewModel.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/14.
//

import Foundation

final class CompletedToDoListViewModel{
    
    var viewUpdate : () -> Void = {}
    private var coreDataManager = CoreDataManager.shared

    func getToDoFilterList() -> [Task]{
        return coreDataManager.getToDoListFromCoreData().filter{$0.isCompleted}
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
