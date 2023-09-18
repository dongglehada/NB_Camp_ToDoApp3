//
//  ProfileViewController.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/13.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    // MARK: - 프로퍼티
    private let proFileView = ProfileView()
    private let viewModel = ProfileViewModel()
}

extension ProfileViewController{
    // MARK: - 라이프 사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

private extension ProfileViewController{
    // MARK: - SetUp 메서드

    func setUp(){
        view.backgroundColor = .systemBackground
        setUpProfileView()

    }
    
    func setUpProfileView(){
        view.addSubview(proFileView)
        proFileView.myCollectionView.delegate = self
        proFileView.myCollectionView.dataSource = self
        proFileView.myCollectionView.register(ProfileVIewCollectionViewCell.self, forCellWithReuseIdentifier: ProfileVIewCollectionViewCell.identifier)
        proFileView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.imageAry.count)
        return viewModel.imageAry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = proFileView.myCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileVIewCollectionViewCell.identifier ,for: indexPath) as? ProfileVIewCollectionViewCell else { return UICollectionViewCell() }
        guard let image = viewModel.imageAry[indexPath.row] else { return UICollectionViewCell() }
        cell.bind(image: image)
        return cell
    }
    
    
}
