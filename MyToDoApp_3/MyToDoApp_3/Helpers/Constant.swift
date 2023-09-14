//
//  Constant.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/12.
//

import Foundation
import UIKit

class Constant{
    
    static let viewWidth = UIScreen.main.bounds.width
    
    static let viewHeight = UIScreen.main.bounds.height
    
    static var defalutHeightPadding = viewHeight / 20
    
    static let main = MainViewConstant()
    
}

final class MainViewConstant: Constant{
    let logoImageWidth = viewWidth / 2
    let logoImageHeight = viewWidth / 4
}
