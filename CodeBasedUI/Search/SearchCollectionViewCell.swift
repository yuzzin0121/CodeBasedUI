//
//  SearchCollectionViewCell.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/30/24.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
    let posterImageView = PosterImageView(frame: .zero)
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
    }
    
    func configureLayout() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(contentView)
            make.height.equalTo(20)
        }
    }
    
    func configureView() {
        posterImageView.image = UIImage(systemName: "person")
        titleLabel.text = "임시 테스트"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white
    }
    
    required init?(coder: NSCoder) {    // 실행될 일이 없다
        fatalError("init(coder:) has not been implemented")
    }
}
