//
//  MovieSecvice.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 23.05.2023.
//

import Foundation

protocol MovieService: AnyObject {
    func fetchMovies(from endPoint: MovieListEndPoint, completion: @escaping (Result<TitleMovie, MovieError>) -> ())
    func fetchMovie(id: Int, completion: @escaping (Result<Title, MovieError>) -> ())
    func searchingMovies(query: String, completion: @escaping (Result<TitleMovie, MovieError>) -> ())
}

enum MovieListEndPoint: String, CaseIterable {
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndPoint
    case invalidResponce
    case noData
    case serializationError
    
    var localizeDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndPoint: return "Invalid endPoint"
        case .invalidResponce: return "Invalid responce"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizeDescription]
    }
}
