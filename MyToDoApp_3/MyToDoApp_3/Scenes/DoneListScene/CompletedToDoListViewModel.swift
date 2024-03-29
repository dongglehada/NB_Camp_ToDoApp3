//
//  CompletedToDoListViewModel.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/14.
//

import Foundation

final class CompletedToDoListViewModel{
    
    var viewUpdate : () -> Void = {}
    private var coreDataManager = CoreDataManager()
    
    deinit{
        print("completedTodoListViewModel deinit")
    }
    
}
extension CompletedToDoListViewModel{
    // MARK: - CoreData CRUD
    
    //정보 가져오기
    func getToDoFilterList() -> [Task]{
        return coreDataManager.getToDoListFromCoreData().filter{$0.isCompleted}
    }
    
    //완료토글 수정하기
    func updateToDoCompletedToggle(task: Task){
        print(#function)
        coreDataManager.updateCompleted(task: task) {
            self.viewUpdate()
        }
    }
    
    //내용 수정하기
    func updateToDoTitle(task:Task, title:String){
        print(#function)
        coreDataManager.updateToDo(task: task, newTitle: title) {
            self.viewUpdate()
        }
    }
    
    //정보 추가하기
    func addToDo(title: String){
        print(#function)
        coreDataManager.saveToDoData(title: title) {
            self.viewUpdate()
        }
    }

    //정보 삭제하기
    func deleteToDo(task:Task){
        print(#function)
        coreDataManager.deleteToDo(task: task) {
            self.viewUpdate()
        }
    }
}
