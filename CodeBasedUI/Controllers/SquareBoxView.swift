//
//  SquareBoxView.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/29/24.
//

import UIKit

/*
 XIB(XML Interface Builder) -> Compile 시 NIB (NSCoder)
 
 @IBInspectable, IBDesignable => Interface Builder에서 컴파일 시점에, 즉 실시가능로 객체에 속성을 적용
 */
@IBDesignable // 반영!
class SquareBoxView: UIView {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // Codable
    // String > Data > Struct > Decodable
    // Struct > Data > String > Encodable
    // 코드베이스로 작업했을 떄 실행되는 init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
    // 스토리보드 기반으로 작업했을 때 실행되는 init
    // 실패가능한 이니셜라이저 > initial이 nil이 될 수 있다는 의미: 초기화가 안될 수도 있음
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
        loadView()
        loadUI()
    }
    
    func loadView() {
        // xib 만든거 가져와야함
        let view = UINib(nibName: "SquareBoxView", bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        self.addSubview(view)
    }
    
    func loadUI() {
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        posterImageView.image = UIImage(systemName: "star.fill")
        posterImageView.backgroundColor = .green
    }
    
    // 반영 될때도 있고 안될때도 있어서 Deprecated 된듯..?
    @IBInspectable  // 스토리보드 인스펙터 영역에 보여주기만...
    var cornerRadius: CGFloat {
        get {
            return posterImageView.layer.cornerRadius
        }
        set {
            posterImageView.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable 
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: posterImageView.layer.borderColor!)
        }
        set {
            posterImageView.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return posterImageView.layer.borderWidth
        }
        set {
            posterImageView.layer.borderWidth = newValue
        }
    }
    
}
