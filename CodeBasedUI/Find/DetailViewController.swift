//
//  DetailViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/31/24.
//

import UIKit
import SnapKit

class DetailViewController: BaseViewController {

    let label = UILabel()
    
    override func viewDidLoad() {   // UIViewController
        super.viewDidLoad()
        print("Detail ViewDidLoad")
    }
    
    // 부모클래스가 가지고 있는 메서드를 재정의해서 쓸 수 있다.
    override func configureHierarchy() {
        super.configureHierarchy()
        view.addSubview(label)
    }
    
    override func configureLayout() {
        super.configureLayout()
        label.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        super.configureView()
        label.backgroundColor = .red
    }
}

