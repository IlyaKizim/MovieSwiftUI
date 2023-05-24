//
//  MovieTitle.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 23.05.2023.
//

import Foundation

struct TitleMovie: Decodable {
    let results: [Title]
}

struct Title: Decodable, Identifiable {
    let backdropPath: String?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double?
    let voteCount: Int?
        
    enum CodingKeys: String, CodingKey {
       case backdropPath = "backdrop_path"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
