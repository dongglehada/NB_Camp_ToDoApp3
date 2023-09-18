//
//  ToDoListViewController.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//

import UIKit
import SnapKit

final class ToDoListViewController: UIViewController {
    // MARK: - 프로퍼티
    private let viewModel = TodoListViewModel()
    
    private let myTableview = ListTableView()
    
    private let addButton = TitleSetButton(title: "추가", fontColor: .link)
    
}

extension ToDoListViewController{
    // MARK: - 라이프 사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

private extension ToDoListViewController{
    // MARK: - 메서드

    func setUp(){
        view.backgroundColor = .systemBackground
        setUpTableView()
        setUpAddButton()
        viewModel.viewUpdate = { [weak self] in
            guard let self = self else { return }
            self.myTableview.reloadData()
        }
    }
    
    func setUpTableView(){
        view.addSubview(myTableview)
        myTableview.register(ToDoListCell.self, forCellReuseIdentifier: ToDoListCell.identifier)
        myTableview.dataSource = self
        myTableview.delegate = self
        myTableview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setUpAddButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(self, action: #selector(didTappedAddButton), for: .touchUpInside)
    }
    
    // MARK: - 추후 수정 필요

    @objc func didTappedAddButton(){
        print(#function)
        let alert = UIAlertController(title: "할일 추가", message: "", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "완료", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            self.viewModel.addToDo(title: text)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in }
        alert.addTextField()
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getToDoList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableview.dequeueReusableCell(withIdentifier: ToDoListCell.identifier ,for: indexPath) as? ToDoListCell else { return UITableViewCell() }
        let tasks = Array(viewModel.getToDoList().reversed())
        cell.cellDelegate = self
        cell.bind(task: tasks[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let alert = UIAlertController(title: "메모를 삭제합니다", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                self.viewModel.deleteToDo(task: self.viewModel.getToDoList().reversed()[indexPath.row])
            }
            let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in }
            alert.addAction(cancel)
            alert.addAction(ok)
            
            present(alert, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let alert = UIAlertController(title: "메모 수정", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            guard let title = alert.textFields?.first?.text else { return }
            self.viewModel.updateToDoTitle(task: self.viewModel.getToDoList().reversed()[indexPath.row], title: title)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in }
        alert.addTextField()
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension ToDoListViewController: ButtonTappedDelegate{
    func toDoCellButtonTapped(task: Task) {
        print(#function)
        viewModel.updateToDoCompletedToggle(task: task)
    }
}
