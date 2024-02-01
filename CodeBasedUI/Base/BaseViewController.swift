//
//  BaseViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/31/24.
//

import UIKit


class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Base", #function)

        configureHierarchy()
        configureLayout()
        configureView()
    }
    func configureHierarchy() {
        print("Base", #function)
    }
    func configureLayout() {
        print("Base", #function)
    }
    func configureView() {
        view.backgroundColor = .white
        print("Base", #function)
    }

}
