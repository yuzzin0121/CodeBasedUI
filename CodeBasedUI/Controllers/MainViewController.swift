//
//  ViewController.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/28/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, ViewProtocol {
    let mainVideoImageView = UIImageView()
    
    let imagesStackView = UIStackView()
    let firstVideoImageView = UIImageView()
    let secondVideoImageView = UIImageView()
    let thirdVideoImageView = UIImageView()
    
    let buttonStackView = UIStackView()
    let playButton = UIButton()
    let myListButton = UIButton()
    
    let nowHotContents = UILabel()
    
    let labelStackView = UIStackView()
    let newEpisodeLabel = UILabel()
    let playNowLabel = UILabel()
    let topTenImageView = UIImageView()
    let newSeriesLabel = UILabel()
    let netflixImageView = UIImageView()
    
    let isHiddenArr = [true, false]
    let MovieImageStringArr = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureView()
        setupContstraints()
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }
    
    @objc func playButtonTapped(_ sender: UIButton) {
        [mainVideoImageView, firstVideoImageView, secondVideoImageView, thirdVideoImageView].forEach {
            setRandomImage($0)
        }
        [newEpisodeLabel, playNowLabel, newSeriesLabel, netflixImageView, topTenImageView].forEach {
            setRandomViewHidden($0)
        }
    }
    
    // 랜던 이미지 설정
    func setRandomImage(_ imageView: UIImageView) {
        let randomImageString = MovieImageStringArr.randomElement()!
        imageView.image = UIImage(named: randomImageString)
    }
    
    // 랜덤으로 레이블 숨기기
    func setRandomViewHidden(_ view: UIView) {
        let isHidden: Bool = isHiddenArr.randomElement()!
        view.isHidden = isHidden
    }

    func configureHierarchy() {
        [mainVideoImageView, buttonStackView, nowHotContents, imagesStackView].forEach {
            view.addSubview($0)
        }
        
        [playButton, myListButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        [firstVideoImageView, secondVideoImageView, thirdVideoImageView].forEach {
            imagesStackView.addArrangedSubview($0)
        }
        
        [labelStackView, topTenImageView].forEach {
            secondVideoImageView.addSubview($0)
        }
        
        [newEpisodeLabel, playNowLabel].forEach {
            labelStackView.addArrangedSubview($0)
        }
        
        [netflixImageView, newSeriesLabel].forEach {
            thirdVideoImageView.addSubview($0)
        }
        
    }
    
    func configureView() {
        mainVideoImageView.design(image: UIImage(named: MovieImageStringArr[0]))
        imagesStackView.design()
        firstVideoImageView.design(image: UIImage(named: MovieImageStringArr[1]))
        secondVideoImageView.design(image: UIImage(named: MovieImageStringArr[2]))
        thirdVideoImageView.design(image: UIImage(named: MovieImageStringArr[3]))
        
        buttonStackView.design(spacing: 16)
        playButton.configuration = .imageStyle(image: UIImage(named: "play"), title: "재생", foregroundColor: .black, backgroundColor: .white)
        myListButton.configuration = .imageStyle(image: UIImage(systemName: "plus"), title: "내가 찜한 리스트", foregroundColor: .white, backgroundColor: .gray)
        
        nowHotContents.design(text: "지금 뜨는 콘텐츠", font: .boldSystemFont(ofSize: 16))
        
        labelStackView.design(axis: .vertical, spacing: 2)
        newEpisodeLabel.design(text: "새로운 에피소드", font: .systemFont(ofSize: 11), backgroundColor: .red, textAlignment: .center)
        playNowLabel.design(text: "지금 시청하기", font: .systemFont(ofSize: 11), textColor: .black, backgroundColor: .white, textAlignment: .center)
        
        newSeriesLabel.design(text: "새로운 시리즈", font: .systemFont(ofSize: 11), backgroundColor: .red, textAlignment: .center)
        
        topTenImageView.design(image: UIImage(named: "top10 badge"), cornerRadius: nil, contentMode: .scaleAspectFit)
        netflixImageView.design(image: UIImage(named: "single-small"), cornerRadius: nil, contentMode: .scaleAspectFit)
    }
    
    func setupContstraints() {
        mainVideoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(UIScreen.main.bounds.height * 0.55)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(mainVideoImageView).inset(16)
            make.height.equalTo(32)
        }
        
        nowHotContents.snp.makeConstraints { make in
            make.leading.equalTo(mainVideoImageView)
            make.top.equalTo(mainVideoImageView.snp.bottom).offset(8)
        }
        
        imagesStackView.snp.makeConstraints { make in
            make.top.equalTo(nowHotContents.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(mainVideoImageView)
            make.height.equalTo(150)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.bottom.equalTo(secondVideoImageView.snp.bottom)
            make.horizontalEdges.equalTo(secondVideoImageView).inset(12)
        }
        
        topTenImageView.snp.makeConstraints { make in
            make.top.trailing.equalTo(secondVideoImageView)
            make.height.equalTo(28)
            make.width.equalTo(20)
        }
        
        newEpisodeLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
        
        playNowLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
        }
        
        netflixImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(thirdVideoImageView)
            make.height.equalTo(28)
            make.width.equalTo(20)
        }
        
        newSeriesLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(thirdVideoImageView).inset(12)
            make.height.equalTo(18)
            make.bottom.equalTo(thirdVideoImageView.snp.bottom)
        }
    }
}

