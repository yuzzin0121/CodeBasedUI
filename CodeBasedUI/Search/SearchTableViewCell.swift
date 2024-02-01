//
//  SearchTableViewCell.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/30/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    let titleLabel = BlackTextLabel()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewFlowLayout())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 138)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
    
        return layout
    }
    
    func configureHierarchy() {
        [titleLabel, collectionView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview().inset(16)
            make.height.equalTo(22)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(contentView).inset(16)
        }
    }
    
    func configureView() {
        backgroundColor = .systemGray6
        titleLabel.font = .boldSystemFont(ofSize: 16)
//        titleLabel.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
