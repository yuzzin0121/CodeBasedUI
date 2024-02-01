//
//  SearchViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/29/24.
//

import UIKit
import SnapKit
import Kingfisher

class Search2ViewController: UIViewController {
    
    // 인스턴스 프로퍼티
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        return tableView
    }()
    
    // 임의로 배열을 만들기
    var list: [Movie] = []     // 상단 컬렉션 뷰
    let titleList: [String] = ["어벤져스 포스터", "해리포터 포스터", "엑스맨 포스터", "스파이더맨 포스터"] // 테이블뷰의 레이블
    var idList: [Int] = [24428, 299536, 99861, 1003598, 518068]
    var imageList: [PosterModel] = [
        PosterModel(posters: []),
        PosterModel(posters: []),
        PosterModel(posters: []),
        PosterModel(posters: []),
        PosterModel(posters: [])
    ]
    
    // 1. imageList -> TableView -> CollectionView
    // 2. 네트워크 요청 > 응답 > imageList > reload
    
    /*
     1. 갱신이 생각보다 과도하다! => 네트워크 통신 응답을 다 받고, 갱신을 한 번만
     2. 반복문 사용
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureView()
        
        let group = DispatchGroup() // + 1
        
        group.enter()
        DispatchQueue.global().async(group: group) {
            TMDBAPIManager.shared.fetchTrendingMovie { movies in
                self.list = movies
                group.leave()
            }
        }
        
        for index in 0...idList.count - 1 {
            group.enter()
            DispatchQueue.global().async(group: group) {
                TMDBAPIManager.shared.fetchMovieImages(id: self.idList[index]) { poster in
                    self.imageList[index].posters = poster.posters
                    group.leave()
                }
            }
        }

        // 0이 되는 순간 notify를 호출하게 된다.
        group.notify(queue: .main) {
            self.tableView.reloadData()
            self.collectionView.reloadData()
        }
    }
    
    func callBack() {
        // 1. 과도한 테이블 갱신 문제 해결
        // 콜백 지옥
        TMDBAPIManager.shared.fetchMovieImages(id: idList[0]) { poster in
            self.imageList[0].posters = poster.posters
            
            TMDBAPIManager.shared.fetchMovieImages(id: self.idList[1]) { poster in
                self.imageList[1].posters = poster.posters
                
                TMDBAPIManager.shared.fetchMovieImages(id: self.idList[2]) { poster in
                    self.imageList[2].posters = poster.posters
                    
                    TMDBAPIManager.shared.fetchMovieImages(id: self.idList[3]) { poster in
                        self.imageList[3].posters = poster.posters
                        
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureView() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .systemGray6
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "Search")
        collectionView.isPagingEnabled = true
        
    }
    
    // 인스턴스 메서드
    func configureCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        return layout
    }
}

extension Search2ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.collectionView == collectionView {
            return list.count
        } else {
            return imageList[collectionView.tag].posters.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.collectionView == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Search", for: indexPath) as! SearchCollectionViewCell
            
            let item = list[indexPath.row]
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(item.backdropPath)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(named: "스즈메의문단속"))
            cell.titleLabel.text = item.title
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Search", for: indexPath) as! SearchCollectionViewCell
            
            let url = URL(string: "https://image.tmdb.org/t/p/w500\(imageList[collectionView.tag].posters[indexPath.row].file_path)")
            cell.posterImageView.kf.setImage(with: url, placeholder: UIImage(named: "스즈메의문단속"))
            
            return cell
        }
        
    }
}

extension Search2ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "Search")
        cell.collectionView.tag = indexPath.row
        cell.collectionView.reloadData()
        cell.titleLabel.text = String(idList[indexPath.row])
        
        return cell
    }
}

