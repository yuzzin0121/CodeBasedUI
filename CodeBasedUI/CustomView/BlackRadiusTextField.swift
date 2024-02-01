//
//  BlackRediusTextField.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/29/24.
//

import UIKit

/*
 스토리보드 기반 > required init O
 코드 기반 > override init / required init O -  둘 다 불러야한다.
 - 왜 계속 호출을 하라고 하지?
 ->
 */

/*
 override: 재정의. 슈퍼클래스
 required: 프로토콜
 override required init : 부모 클래스. 부모클래스에서 프로토콜을 채택
 
 NSObject Class: init(frame:)   / NSCoding: init?(coder: )
 -> UIViewController
 -> UIView
    -> UITextField
    -> UIImageView
 
 */

@IBDesignable
class BlackRadiusTextField: UITextField {

    // 코드로 작업했을 떄 init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    func configureView() {
        backgroundColor = .clear
        textAlignment = .center
        borderStyle = .none
        layer.cornerRadius = 8
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
    // 스토리보드로 작업했을 때 init. - NSCoding Protocol
    // 초기화가 실패되게 만들거야 라고 만들어둔 이유가 뭘까?
    // 코드베이스로 작업했을 때는 실행이 되면 안되게 해야한다. -
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
//        fatalError("init(coder:) has not been implemented")
    }
    
    // 반영 될때도 있고 안될때도 있어서 Deprecated 된듯..?
    @IBInspectable  // 스토리보드 인스펙터 영역에 보여주기만...
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
}


