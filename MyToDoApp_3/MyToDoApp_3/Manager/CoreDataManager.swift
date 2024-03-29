//
//  CoreDataManager.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//

import Foundation
import CoreData
import UIKit

final class CoreDataManager{
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    private lazy var context = appDelegate?.persistentContainer.viewContext
    private let modelName: String = "Task"
    
    deinit{
        print("코어데이터 메니저 deinit")
    }
}
extension CoreDataManager{
    // MARK: - CRUD
    
    // MARK: - [Read] 코어데이터에 저장된 데이터 모두 읽어오기
    func getToDoListFromCoreData() -> [Task] {
        var toDoList: [Task] = []
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            
            do {
                // 임시저장소에서 (요청서를 통해서) 데이터 가져오기 (fetch메서드)
                if let fetchedToDoList = try context.fetch(request) as? [Task] {
                    toDoList = fetchedToDoList
                }
            } catch {
                print("가져오는 것 실패")
            }
        }
        
        return toDoList
    }
    // MARK: - [Create] 코어데이터에 데이터 생성하기
    func saveToDoData(title: String?, completion: @escaping () -> Void) {
        // 임시저장소 있는지 확인
        if let context = context {
            // 임시저장소에 있는 데이터를 그려줄 형태 파악하기
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {

                // 임시저장소에 올라가게 할 객체만들기 (NSManagedObject ===> ToDoData)
                if let toDoData = NSManagedObject(entity: entity, insertInto: context) as? Task {

                    // MARK: - ToDoData에 실제 데이터 할당
                    toDoData.title = title
                    toDoData.id = UUID()
                    toDoData.createDate = Date.now
                    toDoData.isCompleted = false
                    toDoData.modifyDate = Date.now
                    appDelegate?.saveContext() // 앱델리게이트의 메서드로 해도됨
                }
            }
        }
        completion()
    }
    
    // MARK: - [Delete] 코어데이터에서 데이터 삭제하기 (일치하는 데이터 찾아서 ===> 삭제)
    func deleteToDo(task: Task, completion: @escaping () -> Void) {
        
        guard let id = task.id else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)

            do {
                // 요청서를 통해서 데이터 가져오기 (조건에 일치하는 데이터 찾기) (fetch메서드)
                if let fetchedToDoList = try context.fetch(request) as? [Task] {

                    // 임시저장소에서 (요청서를 통해서) 데이터 삭제하기 (delete메서드)
                    if let targetToDo = fetchedToDoList.first {
                        context.delete(targetToDo)
                        appDelegate?.saveContext() // 앱델리게이트의 메서드로 해도됨
                    }
                }
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
    
    // MARK: - [Update] 코어데이터에서 데이터 수정하기 (일치하는 데이터 찾아서 ===> 수정)
    func updateToDo(task: Task, newTitle: String, completion: @escaping () -> Void) {
        
        guard let id = task.id else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)

            do {
                // 요청서를 통해서 데이터 가져오기
                if let fetchedToDoList = try context.fetch(request) as? [Task] {
                    // 배열의 첫번째
                    if let targetToDo = fetchedToDoList.first {

                        // MARK: - ToDoData에 실제 데이터 재할당(바꾸기) ⭐️
                        targetToDo.title = newTitle
                        targetToDo.modifyDate = Date.now
                        appDelegate?.saveContext() // 앱델리게이트의 메서드로 해도됨
                    }
                }
                completion()
            } catch {
                print("수정 실패")
                completion()
            }
        }
    }
    // MARK: - [Update] 코어데이터에서 데이터 수정하기 (일치하는 데이터 찾아서 ===> 수정)
    func updateCompleted(task: Task, completion: @escaping () -> Void) {
        
        guard let id = task.id else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "id = %@", id as CVarArg)

            do {
                // 요청서를 통해서 데이터 가져오기
                if let fetchedToDoList = try context.fetch(request) as? [Task] {
                    // 배열의 첫번째
                    if let targetToDo = fetchedToDoList.first {

                        // MARK: - ToDoData에 실제 데이터 재할당(바꾸기) ⭐️
                        targetToDo.isCompleted.toggle()
                        targetToDo.modifyDate = Date.now
                        appDelegate?.saveContext() // 앱델리게이트의 메서드로 해도됨
                    }
                }
                completion()
            } catch {
                print("수정 실패")
                completion()
            }
        }
    }

}
