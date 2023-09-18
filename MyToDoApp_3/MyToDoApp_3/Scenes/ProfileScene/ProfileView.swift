//
//  ProfileView.swift
//  MyToDoApp_3
//
//  Created by SeoJunYoung on 2023/09/15.
//

import UIKit
import SnapKit

final class ProfileView: UIView {

    private let userNameLabel = UILabel()
    private let menuButton = UIButton()
    private let profileImage = UIImageView()
    private let countStackView = UIStackView()
    private let postCountView = CountTitleVIew(count: "7", title: "post")
    private let followerCountView = CountTitleVIew(count: "0", title: "follower")
    private let followingCountView = CountTitleVIew(count: "0", title: "following")
    private let infoStackView = UIStackView()
    private let nickNameLabel = UILabel()
    private let infoLabel = UILabel()
    private let linkLabel = UILabel()
    private let buttonStackView = UIStackView()
    private let followButton = UIButton()
    private let messageButton = UIButton()
    private let smallMenuButton = UIButton()
    private let segmentedControlTopLine = UIView()
    private let segmentedControl:UISegmentedControl = {
        let control = UnderlineSegmentedControl(items: ["", "", ""])
        control.selectedSegmentIndex = 0
        return control
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension ProfileView{
    
    func setUp(){
        setUpUserNameLabel()
        setUpMenuButton()
        setUpProfileImage()
        setUpCountStackView()
        setUpInfoStackView()
        setUpButtonStackView()
        setUpSegmentedControl()
    }
    
    func setUpUserNameLabel(){
        self.addSubview(userNameLabel)
        userNameLabel.frame = CGRect(x: 0, y: 0, width: 97, height: 25)
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        userNameLabel.textAlignment = .center
        userNameLabel.attributedText = NSMutableAttributedString(string: "nabaecamp", attributes: [NSAttributedString.Key.kern: -1])
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(10)
        }
    }
    
    func setUpMenuButton(){
        self.addSubview(menuButton)
        menuButton.setImage(UIImage(named: "MenuButton"), for: .normal)
        menuButton.snp.makeConstraints { make in
            make.centerY.equalTo(userNameLabel)
            make.width.equalTo(21)
            make.height.equalTo(17.5)
            make.right.equalTo(self.snp.right).inset(16)
        }
    }
    
    func setUpProfileImage(){
        self.addSubview(profileImage)
        profileImage.image = UIImage(named: "ProfileImage")
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(14)
            make.width.height.equalTo(88)
            make.left.equalTo(self.snp.left).inset(14)

        }
    }
    
    func setUpCountStackView(){
        countStackView.addArrangedSubview(postCountView)
        countStackView.addArrangedSubview(followerCountView)
        countStackView.addArrangedSubview(followingCountView)
        self.addSubview(countStackView)
        countStackView.distribution = .fillEqually
        countStackView.axis = .horizontal
        countStackView.snp.makeConstraints { make in
            make.centerY.equalTo(self.profileImage.snp.centerY)
            make.right.equalTo(self.snp.right).inset(28)
            make.left.equalTo(profileImage.snp.right).offset(28)
        }
    }
    
    func setUpInfoStackView(){
        nickNameLabel.text = "르탄이"
        nickNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        infoStackView.addArrangedSubview(nickNameLabel)
        infoLabel.text = "iOS Developer🍎"
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoStackView.addArrangedSubview(infoLabel)
        linkLabel.text = "spartacodingclub.kr"
        linkLabel.font = UIFont.systemFont(ofSize: 14)
        linkLabel.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
        infoStackView.addArrangedSubview(linkLabel)
        self.addSubview(infoStackView)
        infoStackView.axis = .vertical
        infoStackView.spacing = 3
        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(CGFloat.defalutPadding)
            make.left.equalTo(profileImage.snp.left).offset(5)
        }
    }
    
    func setUpButtonStackView(){
        followButton.setImage(UIImage(named: "FollowButton"), for: .normal)
        messageButton.setImage(UIImage(named: "MessageButton"), for: .normal)
        smallMenuButton.setImage(UIImage(named: "SmallMenuButton"), for: .normal)
        smallMenuButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        buttonStackView.addArrangedSubview(followButton)
        buttonStackView.addArrangedSubview(messageButton)
        buttonStackView.addArrangedSubview(smallMenuButton)
        buttonStackView.spacing = 8
        buttonStackView.distribution = .fillProportionally
        self.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(infoStackView.snp.bottom).offset(CGFloat.defalutPadding)
            make.left.equalTo(infoStackView.snp.left)
            make.right.equalTo(self.snp.right).inset(28)
        }
    }
    
    func setUpSegmentedControl(){
        self.addSubview(segmentedControlTopLine)
        segmentedControlTopLine.backgroundColor = .systemGray4
        segmentedControlTopLine.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(CGFloat.defalutPadding)
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        self.addSubview(segmentedControl)
        let gridImage = UIImage(named: "GridImage")
        segmentedControl.setImage(gridImage?.resizedImage(to: CGSize(width: 22.5, height: 22.5)), forSegmentAt: 0)
        segmentedControl.tintColor = .black
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(segmentedControlTopLine.snp.bottom)
            make.height.equalTo(44)
            make.left.right.equalToSuperview()
        }
    }
    
}
