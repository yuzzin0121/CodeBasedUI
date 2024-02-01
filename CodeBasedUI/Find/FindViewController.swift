//
//  FindViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/31/24.
//

import UIKit

class FindViewController: UIViewController {
    let mainView = FindView()
    var list: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.searchBar.delegate = self
    }
    
    // 실행하고나서 뷰가 준비가 될때 바뀐다. - 런타임 시점
    // 따라서 view.collectionView로 설정해도 상관없지않을까? 싶지만 컴파일 시점에서는 인식하지 못함.
    override func loadView() {
        self.view = mainView
    }

}

extension FindViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 수업상 진도때문에 searchBar.text! 강제 언래핑 한 것 -> 개인적으로 할 때는 옵셔널 바인딩 해야함
        TMDBAPIManager.shared.searchMovie(query: searchBar.text!) { movie in
            self.list = movie
            self.mainView.collectionView.reloadData()
        }
    }
}

extension FindViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Search", for: indexPath) as! SearchCollectionViewCell
        
        let item = list[indexPath.row]
        if let poster = item.posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(poster)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(named: "스즈메의문단속"))
        } else {
            cell.posterImageView.image = UIImage(named: "스즈메의문단속")
        }
        
//        print(url)
        
        cell.titleLabel.text = item.title
        
        return cell
    }
}

