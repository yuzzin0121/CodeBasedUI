//
//  BlackTextLabel.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/29/24.
//

import UIKit

class BlackTextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    func configureView() {
        font = .boldSystemFont(ofSize: 15)
        textAlignment = .left
        numberOfLines = 2
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
