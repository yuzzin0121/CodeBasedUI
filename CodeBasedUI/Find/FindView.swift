//
//  FindView.swift
//  CodeBasedUI
//
//  Created by 조유진 on 2/1/24.
//

import UIKit

class FindView: BaseView {
    // viewDidLoad보다 클로저 구문이 먼저 실행!
    // FindViewController 인스턴스 생성 전에, 클로저가 먼저 실행
    let searchBar: UISearchBar = {  // 뷰가 가지고 있는 일괄적인 스타일을 적용하고 다시 리턴하는 함수를 넣어준다.
        let searchBar = UISearchBar()
        searchBar.placeholder = "영화를 검색해보세요"
        searchBar.showsCancelButton = true
        searchBar.barStyle = .black
        
        return searchBar
    }()
    
    
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: FindView.configureCollectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "Search")
        return view
    }()
    
    // BaseView에서 init에 configure 함수를 호출했기 때문에 여기에서는 안써도 된당
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // 인스턴스 메서드
    static func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        
        return layout
    }
    
    override func configureHierarchy() {
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    override func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
    
    override func configureView() {
        
    }
}
