//
//  SavedListViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit

class SavedListViewController: UIViewController, ViewProtocol {
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let videosImageView = UIImageView()
    
    let settingButton = UIButton()
    let showSavableContentButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        setupContstraints()
    }
    
    func configureHierarchy() {
        [titleLabel, descriptionLabel, videosImageView, settingButton, showSavableContentButton].forEach {
            view.addSubview($0)
        }
    }
    
    func configureView() {
        titleLabel.design(text: "'나만의 자동 저장' 기능", font: .boldSystemFont(ofSize: 16), textAlignment: .center)
        descriptionLabel.design(text: "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요.", font: .systemFont(ofSize: 13), textColor: .gray,textAlignment: .center, numberOfLines: 0)
        videosImageView.design(image: UIImage(named: "dummy"), cornerRadius: nil, contentMode: .scaleAspectFit)
        
        settingButton.configuration = .imageStyle(image: nil, font: .boldSystemFont(ofSize: 14),title: "설정하기", foregroundColor: .white, backgroundColor: .systemIndigo)
        showSavableContentButton.configuration = .imageStyle(image: nil, font: .boldSystemFont(ofSize: 14), title: "저장 가능한 콘텐츠 살펴보기", foregroundColor: .black, backgroundColor: .white)
    }
    
    func setupContstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.horizontalEdges.equalTo(view).inset(24)
            make.height.equalTo(24)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(view).inset(24)
            make.height.equalTo(80)
        }
        
        videosImageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.horizontalEdges.greaterThanOrEqualTo(36)
            make.height.equalTo(250)
            make.width.equalTo(300)
        }
        
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(videosImageView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(224)
            make.height.equalTo(35)
        }
        
        showSavableContentButton.snp.makeConstraints { make in
            make.top.equalTo(settingButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(190)
            make.height.equalTo(32)
        }
    }

}
