//
//  HomeView.swift
//  CodeBasedUI
//
//  Created by 조유진 on 2/1/24.
//

import UIKit
import SnapKit

class HomeView: BaseView {
    let logoImageView = PosterImageView(frame: .zero)
    
    // 장점 - view 각각의 디자인을 한 눈에 확인할 수 있다.
    // 단점 - viewController 전체적 관점으로는 가독성이 안좋아진다.
    let emailField : BlackRadiusTextField = {   // closure 구문을 통해서 구현
        let view = BlackRadiusTextField()
        view.placeholder = "이메일을 입력해주세요"
        return view
    }()
    let passwordField = BlackRadiusTextField()
    let sampleLabel = BlackTextLabel()
    
    let signButton: UIButton = {
        let view = UIButton()
        view.setTitle("회원가입", for: .normal)
        view.backgroundColor = .black
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
//    lazy var bar = {
//        let view = UISearchBar()
//        view.placeholder = "asdf"
//        return view
//    }()
    
//    func makeSearchBar() -> UISearchBar {
//        let view = UISearchBar()
//        view.placeholder = "asdf"
//        return view
//    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    @objc func signButtonClicked() {
//        present(FindViewController(), animated: true)
//    }
    
    override func configureHierarchy() {
        addSubview(emailField)
        addSubview(passwordField)
        addSubview(sampleLabel)
        addSubview(logoImageView)
        addSubview(signButton)
    }
    
    // method, extension
    override func configureView() {
        emailField.placeholder = "이메일을 입력해주세요"
        passwordField.placeholder = "비밀번호를 입력해주세요"
        sampleLabel.text = "레이블 커스텀뷰 테스트"
        logoImageView.image = UIImage(systemName: "person")
        
//        signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
    }
    
    // 자기 자신이 view이기 때문에 safeAreaLayoutGuide만 사용
    override func configureLayout() {
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }
        
        emailField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(44)
            make.center.equalTo(safeAreaLayoutGuide)
        }
        
        passwordField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(44)
            make.top.equalTo(emailField.snp.bottom).offset(24)
        }
        
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(50)
            make.top.equalTo(passwordField.snp.bottom).offset(24)
        }
        
        signButton.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
    }

}
