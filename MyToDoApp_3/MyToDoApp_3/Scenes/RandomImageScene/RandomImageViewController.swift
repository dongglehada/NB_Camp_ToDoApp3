//
//  RandomImageViewController.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/15.
//

import UIKit
import SnapKit

final class RandomImageViewController: UIViewController {
    
    lazy var activityIndicator: UIActivityIndicatorView = { // indicator가 사용될 때까지 인스턴스를 생성하지 않도록 lazy로 선언
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.splitViewController?.view.center ?? CGPoint() // indicator의 위치 설정
        activityIndicator.style = UIActivityIndicatorView.Style.large // indicator의 스타일 설정, large와 medium이 있음
        return activityIndicator
    }()
    private let imageView = UIImageView()
    private let refresh = TitleSetButton(title: "새로운 사진", fontColor: .link)
    private let viewModel = RandomImageViewModel()
}

extension RandomImageViewController{
    // MARK: - 라이프 사이클

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        viewModel.fetchImage()
    }
}

private extension RandomImageViewController{
    // MARK: - SetUp

    func setUp(){
        view.backgroundColor = .systemBackground
        refresh.addTarget(self, action: #selector(didTappedRefreshButton), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: refresh)
        setUpImageView()
        setUpIndicator()

    }
    
    func setUpIndicator(){
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setUpImageView(){
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        viewModel.viewUpdate = { [weak self] url in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.activityIndicator.startAnimating()
            }
            self.imageView.urlLoad(url: url) {
                self.activityIndicator.stopAnimating()
            }
        }
    }
    // MARK: - buttonTapped
    
    @objc func didTappedRefreshButton(){
        self.imageView.image = nil
        viewModel.fetchImage()
    }

    
}
