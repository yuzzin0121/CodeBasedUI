//
//  Trending.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/30/24.
//

import Foundation

// 서버 응답이 옵셔널인지 아닌지에 따라서도 식판을 다르게 만들어주어야 한다.
struct TrendingModel: Decodable {
    let page: Int
    let results: [Movie]
}

// 서버에서는 값이 null로 오지만, 클라이언트 모델에서는 옵셔널이 아닌 모델로 구성할 수는 없을까?
struct Movie: Decodable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let backdropPath: String?
    let posterPath: String?
    
    let top10: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case top10
    }
    
    // 식판에 담을 때 약간 변조해서 담겠다는 의미
    // 서벗에서 받은 값을 그대로 사용하지 않고, 일부 제약조건을 추가하거나 값에 대한 변형을 하고 싶을 때 사용
    // ex. 서버에서 null을 줄 떄, 대체할 문자열을 추가하고 싶을 때
    // 만약 tmdb에서 평점을 남긴 사람 수를 준다!
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.title = try container.decodeIfPresent(String.self, forKey: .title)
//        self.originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle) ?? "타이틀 없음"
//        self.overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? "아직 줄거리가 준비되지 않았습니다"
//        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
//        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
//        self.top10 = ""
//    }
}
