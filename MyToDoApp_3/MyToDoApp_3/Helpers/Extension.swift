//
//  Extension.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/12.
//

import Foundation
import UIKit

extension UIImageView{
    func urlLoad(url:URL, completion: @escaping () -> Void){
        DispatchQueue.global().async { [weak self] in
            print("imageLoadStart")
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                        print("imageLoadCompleted")
                        completion()
                    }
                }
            }
        }
    }
}

extension UIImage {
    func resizedImage(to targetSize: CGSize) -> UIImage? {
        let render = UIGraphicsImageRenderer(size: targetSize)
        return render.image { ctx in
            self.draw(in: .init(origin: .zero, size: targetSize))
        }
    }
}

extension CGFloat{
    static let defalutPadding:CGFloat = 16
}


extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
