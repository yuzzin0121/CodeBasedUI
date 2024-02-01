//
//  HomeViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/29/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let mainView = HomeView()
    
    // view의 생명주기 중 하나: viewDidLoad()보다 먼저 호출된다.
    // rootview 대신에 커스텀뷰인 mainView로 갈아끼워진다.
    //  - rootView를 만들어주는 기능, 뷰컨트롤러의 루트뷰 생성
    // 루트뷰 위에서 동작하는 레이블, 버튼 등을 뷰컨트롤러가 아니라 'UIView'가 책임질 수 있게 설정⭐️
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        mainView.signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
    }
    
    @objc func signButtonClicked() {
        present(FindViewController(), animated: true)
    }
}
