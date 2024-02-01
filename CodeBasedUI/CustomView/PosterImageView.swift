//
//  PosterImageView.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/29/24.
//

import UIKit

class PosterImageView: UIImageView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    func configureView() {
        backgroundColor = .lightGray
        contentMode = .scaleAspectFill
        layer.cornerRadius = 12
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        print("textField required init")
        fatalError("init(coder:) has not been implemented")
    }
}

