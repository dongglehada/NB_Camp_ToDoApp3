//
//  MainButton.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/12.
//

import UIKit

final class TitleSetButton: UIButton {

    init(title:String, fontColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(fontColor, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
