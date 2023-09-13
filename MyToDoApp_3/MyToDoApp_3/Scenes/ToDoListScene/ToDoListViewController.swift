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
    
    private let myTableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
}

private extension ToDoListViewController{
    
    func setUp(){
        view.backgroundColor = .systemBackground
        setUpTableView()
    }
    
    func setUpTableView(){
        view.addSubview(myTableview)
        myTableview.dataSource = self
        myTableview.delegate = self
        myTableview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}
