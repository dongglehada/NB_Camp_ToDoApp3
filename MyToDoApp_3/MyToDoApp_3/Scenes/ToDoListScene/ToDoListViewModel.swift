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
    private var coreDataManager = CoreDataManager()
    
    init() {
        print("TodoListViewModel init")
    }
    deinit{
        print("TodoListViewModel deinit")
    }
}

extension TodoListViewModel{
    // MARK: - CoreData CRUD

    //정보 가져오기
    func getToDoList() -> [Task]{
        return self.coreDataManager.getToDoListFromCoreData()
    }
    
    //완료토글 수정하기
    func updateToDoCompletedToggle(task: Task){
        coreDataManager.updateCompleted(task: task) { [weak self] in
            guard let self = self else {return}
            self.viewUpdate()
        }
    }
    
    //내용 수정하기
    func updateToDoTitle(task:Task, title:String){
        coreDataManager.updateToDo(task: task, newTitle: title) { [weak self] in
            guard let self = self else {return}
            self.viewUpdate()
        }
    }
    
    //정보 추가하기
    func addToDo(title: String){
        coreDataManager.saveToDoData(title: title) { [weak self] in
            guard let self = self else {return}
            self.viewUpdate()
        }
    }

    //정보 삭제하기
    func deleteToDo(task:Task){
        coreDataManager.deleteToDo(task: task) { [weak self] in
            guard let self = self else {return}
            self.viewUpdate()
        }
    }
}
