//
//  PosterModel.swift
//  CodeBasedUI
//
//  Created by 조유진 on 1/30/24.
//

import Foundation

struct PosterModel: Decodable {
    var posters: [Poster]
}

struct Poster: Decodable {
    let file_path: String
}
