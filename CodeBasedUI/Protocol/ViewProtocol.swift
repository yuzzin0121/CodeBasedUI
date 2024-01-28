//
//  viewProtocol.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import Foundation

protocol ViewProtocol: AnyObject {
    func configureHierarchy()
    func configureView()
    func setupContstraints()
}
