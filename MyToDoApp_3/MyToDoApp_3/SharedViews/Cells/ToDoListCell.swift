//
//  ToDoListCell.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/14.
//

import UIKit
import SnapKit

class ToDoListCell: UITableViewCell {
    
    static let identifier = "ToDoListCell"
    
    private let titleLabel = UILabel()
    
    private var completedButton = UIButton()
    
    weak var cellDelegate: ButtonTappedDelegate?
    
    private var task: Task = Task()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(task:Task){
        self.task = task
        if task.isCompleted{
            guard let title = task.title else { return }
            titleLabel.attributedText = title.strikeThrough()
        } else {
            titleLabel.attributedText = nil
            titleLabel.text = task.title
        }
        let image = task.isCompleted ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
        completedButton.setImage(image, for: .normal)
    }

}
private extension ToDoListCell{
    
    func setUp(){
        self.completedButton.addTarget(self, action: #selector(didTappedCompletedButton), for: .touchUpInside)
        setUpTitleLabel()
        setUpCompletedView()

    }
    
    func setUpTitleLabel(){
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(CGFloat.defalutPadding)
        }
    }
    
    func setUpCompletedView(){
        contentView.addSubview(completedButton)
        completedButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(CGFloat.defalutPadding)
            make.width.height.equalTo(50)
        }
    }
    
    @objc func didTappedCompletedButton(){
        cellDelegate?.toDoCellButtonTapped(task: task)
    }
}

protocol ButtonTappedDelegate: AnyObject{
    func toDoCellButtonTapped(task:Task)
}
