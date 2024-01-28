//
//  UILabel+Extension.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit

extension UILabel {
    func design(text: String, font: UIFont = .systemFont(ofSize: 14), textColor: UIColor = .white, backgroundColor: UIColor? = nil, textAlignment: NSTextAlignment  = .left) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        if let backgroundColor {
            self.backgroundColor = backgroundColor
        }
    }
}
