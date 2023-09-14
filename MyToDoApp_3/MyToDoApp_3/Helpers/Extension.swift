//
//  Extension.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/12.
//

import Foundation
import UIKit

extension UIImageView{
    
    func urlLoad(url:URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


