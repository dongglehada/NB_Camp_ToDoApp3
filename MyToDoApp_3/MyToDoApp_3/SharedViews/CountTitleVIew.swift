//
//  CountTitleVIew.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/15.
//

import UIKit
import SnapKit

final class CountTitleVIew: UIStackView {

    private let count = UILabel()
    private let title = UILabel()
    
    init(count:String, title:String) {
        super.init(frame: CGRect.zero)
        setUp()
        self.count.text = count
        self.title.text = title
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CountTitleVIew{
    
    func setUp(){
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fill
        setUpCount()
        setUpTitle()
    }
    
    func setUpCount(){
        self.addArrangedSubview(count)
        count.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func setUpTitle(){
        self.addArrangedSubview(title)
        title.font = UIFont.systemFont(ofSize: 14)
    }
    
}
