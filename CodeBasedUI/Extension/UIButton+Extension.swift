//
//  UIButton+Extension.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit

extension UIButton.Configuration {
    static func imageStyle(image: UIImage?, title: String, foregroundColor: UIColor, backgroundColor: UIColor, cornerStyle: UIButton.Configuration.CornerStyle = .fixed) -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        var titleContainer = AttributeContainer()
        titleContainer.font = .systemFont(ofSize: 14)
        config.title = title
        config.attributedTitle = AttributedString(title, attributes: titleContainer)
        config.titleAlignment = .trailing
        config.baseBackgroundColor = backgroundColor
        config.baseForegroundColor = foregroundColor
        
        config.image = image
        config.imagePlacement = .leading
        config.imagePadding = 8
        config.cornerStyle = cornerStyle
        
        return config
    }
}
