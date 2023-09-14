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
    
    func updateCompleted(task: Task){
        coreDataManager.updateCompleted(task: task) { [weak self] in
            guard let self = self else { return }
            self.taskList = self.coreDataManager.getToDoListFromCoreData()
        }
    }

}
