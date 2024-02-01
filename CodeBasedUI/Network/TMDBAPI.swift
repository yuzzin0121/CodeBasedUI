//
//  TMDBAPI.swift
//  CodeBasedUI
//
//  Created by 조유진 on 2/1/24.
//

import Foundation
import Alamofire

// enum의 case rawValue는 고유해야 한다.
enum TMDBAPI: String {
    case trending
    case search
    case photo
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
    
    
    var endpoint: URL {
        switch self{
        case.trending: return URL(string: baseURL + "trending/movie/week")!
        case .search: return URL(string: baseURL + "serach/movie")!
        case .photo: return URL(string: baseURL + "movie/12331/images")!
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization": APIKey.tmdbKey]
    }
    
    var method: HTTPMethod {
        return .get
    }
}
// 열거형은 저장 프로퍼티가 될 수 없다.
// enum은 인스턴스를 만들 수 없는 특성이 있다.
// 1. static , 2. 연산 프로퍼티 로 사용한다.
