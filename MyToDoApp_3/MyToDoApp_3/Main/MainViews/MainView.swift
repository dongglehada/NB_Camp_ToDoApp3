//
//  MainView.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/12.
//

import UIKit
import SnapKit

final class MainView: UIViewController {
    
    private let logoImage = UIImageView()
    
    private let checkListButton = MainButton(title: "할일 확인하기", fontColor: .link)
    
    private let cmpListButton = MainButton(title: "완료한일 보기", fontColor: .link)
    
    private let profileVCButton = MainButton(title: "ProfileViewContorller", fontColor: .link)
    
    private let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

private extension MainView{
    // MARK: - SetUp
    
    func setUp(){
        setUpLogoImageView()
        setUpCheckListButton()
        setUpCmpListButton()
        setUpProfileVCButton()
    }
    
    func setUpLogoImageView(){
        view.addSubview(logoImage)
        guard let url = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg") else { return }
        logoImage.urlLoad(url: url)
        logoImage.contentMode = .scaleAspectFit
        logoImage.snp.makeConstraints { make in
            make.width.equalTo(Constant.viewWidth / 2)
            make.height.equalTo(Constant.viewWidth / 4)
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
        checkListButton.addTarget(self, action: #selector(mainButtonTapped(_:)), for: .touchUpInside)
    }
    
    func setUpCmpListButton(){
        view.addSubview(cmpListButton)
        cmpListButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(checkListButton.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        cmpListButton.addTarget(self, action: #selector(mainButtonTapped(_:)), for: .touchUpInside)
    }
    
    func setUpProfileVCButton(){
        view.addSubview(profileVCButton)
        profileVCButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(cmpListButton.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        profileVCButton.addTarget(self, action: #selector(mainButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func mainButtonTapped(_ sender: Any?){
        
        guard let button = sender as? UIButton else { return }
        var vc = UIViewController()
        
        switch button{
        case checkListButton:
            print(button.titleLabel?.text)
        case cmpListButton:
            print(button.titleLabel?.text)
        case profileVCButton:
            print(button.titleLabel?.text)
        default:
            print("hi~")
        }
//        self.present(vc, animated: true)
    }
    
}
