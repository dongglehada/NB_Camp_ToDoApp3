//
//  ToDoListViewController.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//

import UIKit
import SnapKit

final class ToDoListViewController: UIViewController {

    private let viewModel = TodoListViewModel()
    
    private let myTableview: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.register(ToDoListCell.self, forCellReuseIdentifier: ToDoListCell.identifier)
        return view
    }()
    
    private let addButton = MainButton(title: "추가", fontColor: .link)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
}

private extension ToDoListViewController{
    
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
    
    @objc func didTappedAddButton(){
        print(#function)
    }
}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableview.dequeueReusableCell(withIdentifier: ToDoListCell.identifier ,for: indexPath) as? ToDoListCell else { return UITableViewCell() }
        cell.cellDelegate = self
        cell.bind(task: viewModel.taskList[indexPath.row])
        return cell
    }
    
}

extension ToDoListViewController: ButtonTappedDelegate{
    func toDoCellButtonTapped(task: Task) {
        print(#function)
        viewModel.updateCompleted(task: task)
    }
    

}
