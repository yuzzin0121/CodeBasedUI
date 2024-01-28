//
//  ImageStyle.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit

enum ImageStyle {
    static let house: UIImage = UIImage(systemName: "house")!
    static let houseFill: UIImage = UIImage(systemName: "house.fill")!
    
    static let playRectangleOn: UIImage = UIImage(systemName: "play.rectangle.on.rectangle")!
    static let playRectangleOnFill: UIImage = UIImage(systemName: "play.rectangle.on.rectangle.fill")!
    
    static let arrowDownCircle: UIImage = UIImage(systemName: "arrow.down.circle")!
    static let arrowDownCircleFill: UIImage = UIImage(systemName: "arrow.down.circle.fill")!
    
}

enum TabItem: String {
    case home = "홈"
    case search = "NEW & HOT"
    case list = "저장한 콘텐츠 목록"
    
    var image: UIImage {
        switch self {
        case .home: return ImageStyle.house
        case .search: return ImageStyle.playRectangleOn
        case .list: return ImageStyle.arrowDownCircle
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .home: return ImageStyle.houseFill
        case .search: return ImageStyle.playRectangleOnFill
        case .list: return ImageStyle.arrowDownCircleFill
        }
    }
}
