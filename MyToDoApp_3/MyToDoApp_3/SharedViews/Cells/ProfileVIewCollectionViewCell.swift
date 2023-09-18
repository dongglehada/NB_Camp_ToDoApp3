//
//  ProfileVIewCollectionViewCell.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/18.
//

import UIKit
import SnapKit

final class ProfileVIewCollectionViewCell: UICollectionViewCell {

    static let identifier = "ProfileVIewCollectionViewCell"
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func bind(image:UIImage){
        imageView.image = image
    }
}

private extension ProfileVIewCollectionViewCell{
    func setUp(){
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
