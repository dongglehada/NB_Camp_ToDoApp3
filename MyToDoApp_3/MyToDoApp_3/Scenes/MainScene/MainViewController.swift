//
//  MainView.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/12.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    // MARK: - 프로퍼티
    private let logoImage = UIImageView()
    private let checkListButton = TitleSetButton(title: "할일 확인하기", fontColor: .link)
    private let cmpListButton = TitleSetButton(title: "완료한일 보기", fontColor: .link)
    private let randomImageButton = TitleSetButton(title: "Cat Image", fontColor: .link)
    private let profileVCButton = TitleSetButton(title: "ProfileViewContorller", fontColor: .link)
    private let viewModel = MainViewModel()
}

extension MainViewController{
    // MARK: - 라이프 사이클

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

private extension MainViewController{
    // MARK: - SetUp메서드
    
    func setUp(){
        setUpLogoImageView()
        setUpCheckListButton()
        setUpCmpListButton()
        setUpRandomImageButton()
        setUpProfileVCButton()
    }
    
    func setUpLogoImageView(){
        view.addSubview(logoImage)
        guard let url = URL(string: viewModel.logoURL) else { return }
        
        logoImage.urlLoad(url: url){
            
        }
        
        logoImage.contentMode = .scaleAspectFit
        logoImage.snp.makeConstraints { make in
            make.width.equalTo(Constant.main.logoImageWidth)
            make.height.equalTo(Constant.main.logoImageHeight)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constant.defalutHeightPadding * 2)
        }
    }
    
    func setUpCheckListButton(){
        view.addSubview(checkListButton)
        checkListButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(logoImage.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        checkListButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func setUpCmpListButton(){
        view.addSubview(cmpListButton)
        cmpListButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(checkListButton.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        cmpListButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func setUpRandomImageButton(){
        view.addSubview(randomImageButton)
        randomImageButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(cmpListButton.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        randomImageButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func setUpProfileVCButton(){
        view.addSubview(profileVCButton)
        profileVCButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(randomImageButton.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        profileVCButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    // MARK: - ButtonTapped메서드

    @objc func buttonTapped(_ button: UIButton){
        print(#function)
        var vc = UIViewController()
        switch button{
        case checkListButton:
            vc = ToDoListViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case cmpListButton:
            vc = CompletedToDoListViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case randomImageButton:
            vc = RandomImageViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case profileVCButton:
            vc = ProfileViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        default:
            print("Please connect a new VC")
        }

    }
    
}
