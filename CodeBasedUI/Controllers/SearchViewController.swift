//
//  SearchViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit

class SearchViewController: UIViewController, ViewProtocol {
    
    let searchBar = UISearchBar()
    let toBeReleaseButton = UIButton()
    let popularContentButton = UIButton()
    let topTenButton = UIButton()
    
    let mainTitleLabel = UILabel()
    let subTitleLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureView()
        setupContstraints()
    }
    

    func buttonClicked(_ button: UIButton, active: Bool) {
        if active == true {
            button.backgroundColor = .white
            button.tintColor = .black
        } else {
            button.backgroundColor = .black
            button.tintColor = .white
        }
    }
    
    func setMessage(_ label: UILabel, mainText: String, subText: String) {
        label.text = mainText
        label.text = subText
    }
    
    func configureHierarchy() {
        [searchBar].forEach {
            view.addSubview($0)
        }
    }
    
    func configureView() {
        searchBar.placeholder = "게임, 시리즈, 영화를 검색하세요"
        searchBar.searchTextField.backgroundColor = .darkGray
        searchBar.searchTextField.textColor = .white
        searchBar.backgroundColor = .black
        searchBar.barTintColor = .black
        
    }
    
    func setupContstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
    }
}
