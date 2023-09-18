//
//  DoneListViewController.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//

import UIKit
import SnapKit

final class CompletedToDoListViewController: UIViewController {
    // MARK: - 프로퍼티
    private let myTableview = ListTableView()
    private let viewModel = CompletedToDoListViewModel()
}

extension CompletedToDoListViewController{
    // MARK: - 라이프 사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

private extension CompletedToDoListViewController{
    // MARK: - SetUp 메서드
    
    func setUp(){
        view.backgroundColor = .systemBackground
        setUpTableView()
    }
    
    func setUpTableView(){
        view.addSubview(myTableview)
        myTableview.delegate = self
        myTableview.dataSource = self
        myTableview.register(ToDoListCell.self, forCellReuseIdentifier: ToDoListCell.identifier)
        myTableview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        viewModel.viewUpdate = { [weak self] in
            guard let self = self else {return}
            self.myTableview.reloadData()
        }
    }

}

extension CompletedToDoListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getToDoFilterList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableview.dequeueReusableCell(withIdentifier: ToDoListCell.identifier ,for: indexPath) as? ToDoListCell else { return UITableViewCell() }
        let tasks = Array(viewModel.getToDoFilterList().reversed())
        cell.bind(task: tasks[indexPath.row])
        return cell
    }
    
    
}
