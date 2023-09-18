//
//  ListTableView.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/14.
//

import UIKit

final class ListTableView: UITableView {

    init() {
        super.init(frame: CGRect.zero, style: .plain)
        self.showsVerticalScrollIndicator = true
        self.contentInset = .zero
        self.rowHeight = 44
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
