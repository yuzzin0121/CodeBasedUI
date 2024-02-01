//
//  TMDBAPIManager.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/30/24.
//

import Foundation
import Alamofire

class TMDBAPIManager {
    static let shared = TMDBAPIManager()
    let baseURL = "https://api.themoviedb.org/3/"
    let headers: HTTPHeaders = ["Authorization": APIKey.tmdbKey]
    
    private init() {}
    
    func searchMovie(query: String, completionHandler: @escaping (([Movie]) -> Void)) {
        let url = baseURL + "serach/movie?language=ko-KR&query=\(query)"
        
        // 통신 자체가 잘 되는지 확인
//        AF.request(url, headers: headers).responseString { response in
//            print(response)
//        }
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: TrendingModel.self) { response in
                switch response.result {
                case .success(let success):
                    print("Success", success)
                    completionHandler(success.results)
                case .failure(let failure):
                    print("Failure", failure)
                }
            }
    }
    
    func fetchTrendingMovie(completionHandler: @escaping ([Movie]) -> Void) {
        let url = baseURL + "trending/movie/week?language=ko-KR"
        
        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: TrendingModel.self) { response in
                switch response.result {
                case .success(let success):
                    print("Success", success)
                    completionHandler(success.results)
                case .failure(let failure):
                    print("Failure", failure)
                }
            }
    }   // 1 2 5 3 4
    // 데이터를 응답으로 받기 전에 함수가 return된다. 
    
    func fetchMovieImages(id: Int, completionHandler: @escaping (PosterModel) -> Void) {
        let url = baseURL + "movie/\(id)/images"

        AF.request(url, method: .get, headers: headers)
            .responseDecodable(of: PosterModel.self) { response in
                switch response.result {
                case .success(let success):
                    print("Success", success)
                    completionHandler(success)
                case .failure(let failure):
                    print("Failure", failure)
                }
            }
    }
}
