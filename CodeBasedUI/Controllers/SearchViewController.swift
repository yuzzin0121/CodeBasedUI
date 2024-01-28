//
//  SearchViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit

class SearchViewController: UIViewController, ViewProtocol {
    
    let searchBar = UISearchBar()
    
    let buttonStackView = UIStackView()
    let toBeReleaseButton = UIButton()
    let popularContentButton = UIButton()
    let topTenButton = UIButton()
    
    let mainTitleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    let searchBarPlaceholder = "게임, 시리즈, 영화를 검색하세요"
    let titleMessageArray = ["이런! 공개 예정인 작품이 없습니다.", "찾으시는 인기 콘텐츠가 없습니다.", "현재 TOP 10 시리즈가 존재하지 않습니다."]
    let subTitleMessageArray = ["홈에서 지금 뜨는 콘텐츠를 확인해보세요.", "다른 영화, 시리즈, 배우, 감독 또는 장르를 확인해보세요.", "영화를 홈에서 탐색해보세요."]

    lazy var buttons = [toBeReleaseButton, popularContentButton, topTenButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        setupContstraints()
        toBeReleaseButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        popularContentButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        topTenButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
     
    @objc func buttonClicked(sender: UIButton) {
        for button in buttons {
            if button == buttons[sender.tag] {
                setbuttonColor(button, active: true)
            }
            else {
                setbuttonColor(button, active: false)
            }
        }
        setMessage(titleLabel: mainTitleLabel, subTitleLabel: subTitleLabel, mainText: titleMessageArray[sender.tag], subText: subTitleMessageArray[sender.tag])
    }

    func setbuttonColor(_ button: UIButton, active: Bool) {
        var config = button.configuration
        if active == true {
            config?.baseBackgroundColor = .white
            config?.baseForegroundColor = .black
        } else {
            config?.baseBackgroundColor = .black
            config?.baseForegroundColor = .white
        }
        button.configuration = config
    }
    
    func setMessage(titleLabel: UILabel, subTitleLabel: UILabel, mainText: String, subText: String) {
        titleLabel.text = mainText
        subTitleLabel.text = subText
    }
    
    func configureHierarchy() {
        [searchBar, buttonStackView, mainTitleLabel, subTitleLabel].forEach {
            view.addSubview($0)
        }
        
        buttons.forEach {
            buttonStackView.addArrangedSubview($0)
        }
    }
    
    func configureView() {
        searchBar.placeholder = searchBarPlaceholder
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: searchBarPlaceholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        searchBar.searchTextField.backgroundColor = UIColor(named: "darkBlack")
        searchBar.searchTextField.textColor = .white
        searchBar.backgroundColor = .black
        searchBar.barTintColor = .black
        
        buttonStackView.design(distribution: .equalSpacing, spacing: 16)
        toBeReleaseButton.configuration = .imageStyle(image: UIImage(named: "blue"), font: .systemFont(ofSize: 12), title: "공개 예정", foregroundColor: .black, backgroundColor: .white, cornerStyle: .capsule)
        popularContentButton.configuration = .imageStyle(image: UIImage(named: "turquoise"), font: .systemFont(ofSize: 12), title: "모두의 인기 콘텐츠", foregroundColor: .white, backgroundColor: .black, cornerStyle: .capsule)
        topTenButton.configuration = .imageStyle(image: UIImage(named: "pink"), font: .systemFont(ofSize: 12), title: "TOP 10 시리즈", foregroundColor: .white, backgroundColor: .black, cornerStyle: .capsule)
        
        for index in 0...buttons.count - 1 {
            buttons[index].tag = index
        }
        
        mainTitleLabel.design(text: titleMessageArray[0], font: .boldSystemFont(ofSize: 23), textAlignment: .center, numberOfLines: 2)
        subTitleLabel.design(text: subTitleMessageArray[0], font: .systemFont(ofSize: 16), textColor: .gray, textAlignment: .center, numberOfLines: 2)
        
        
    }
    
    func setupContstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(searchBar)
            make.top.equalTo(searchBar.snp.bottom).offset(12)
            make.height.equalTo(32)
            make.horizontalEdges.greaterThanOrEqualTo(view).inset(16)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.horizontalEdges.greaterThanOrEqualTo(view).inset(16)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.horizontalEdges.greaterThanOrEqualTo(view).inset(16)
        }
        
    }
}
