//
//  BaseView.swift
//  CodeBasedUI
//
//  Created by 조유진 on 2/1/24.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    func configureHierarchy() {}
    func configureLayout() {}
    func configureView() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
