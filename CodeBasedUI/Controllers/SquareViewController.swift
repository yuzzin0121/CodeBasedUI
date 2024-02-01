//
//  SquareViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/29/24.
//

import UIKit

/*
 XIB(XML Interface Builder) -> Compile 시 NIB (NSCoder)
 
 @BInspectable, IBDesignable => Interface Builder에서 컴파일 시점에, 즉 실시가능로 객체에 속성을 적용
 */


// BlackRadiusTextField
// CodeBase. HomeVC에서는 코드로 그래로 사용. override init
// Storyboard에 BlackRadiusTextField가 추가된 상황. required init
class SquareViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
        
        
    }
    

}
