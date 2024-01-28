//
//  UIStackView+Extension.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit

extension UIStackView {
    func design(axis: NSLayoutConstraint.Axis = .horizontal, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fillEqually, spacing: CGFloat = 12) {
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }
}
