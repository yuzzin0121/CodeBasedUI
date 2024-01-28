//
//  UIImageView+Extension.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit

extension UIImageView {
    func design(image: UIImage?, cornerRadius: CGFloat? = 8, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.image = image
        self.contentMode = contentMode
        if let cornerRadius {
            self.clipsToBounds = true
            self.layer.cornerRadius = cornerRadius
        }
        
    }
}
