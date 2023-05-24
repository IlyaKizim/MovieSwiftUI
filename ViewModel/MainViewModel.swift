//
//  MainViewModel.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 23.05.2023.
//

import Foundation
import SwiftUI

enum MovieData: Identifiable {
    case popular(id: UUID = UUID(), titles: [Title])
    case topRated(id: UUID = UUID(), titles: [Title])
    case upcoming(id: UUID = UUID(), titles: [Title])
    case nowPlaying(id: UUID = UUID(), titles: [Title])
    
    var id: UUID {
        switch self {
        case .popular(let id, _):
            return id
        case .topRated(let id, _):
            return id
        case .upcoming(let id, _):
            return id
        case .nowPlaying(let id, _):
            return id
        }
    }
    
    var titles: [Title] {
        switch self {
        case .popular(_, let titles):
            return titles
        case .topRated(_, let titles):
            return titles
        case .upcoming(_, let titles):
            return titles
        case .nowPlaying(_, let titles):
            return titles
        }
    }
}

enum Index: Int {
    case popular = 0
    case topRated
    case upcoming
    case nowPlaying
}

class MainViewModel: ObservableObject {
    var movieService: MovieService
    @Published var movieData: [MovieData] = [
        .popular(id: UUID(), titles: []),
        .topRated(id: UUID(), titles: []),
        .upcoming(id: UUID(), titles: []),
        .nowPlaying(id: UUID(), titles: [])
    ]
    
    init(movieService: MovieService) {
        self.movieService = movieService
        getData()
    }
    
    func getData() {
        movieService.fetchMovies(from: .popular) { [weak self] result in
            switch result {
            case .success(let result):
                self?.updateMovieData(index: Index.popular.rawValue, updatedData: .popular(titles: result.results))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        movieService.fetchMovies(from: .topRated) { [weak self] result in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self?.updateMovieData(index: Index.topRated.rawValue, updatedData: .topRated(titles: result.results))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        movieService.fetchMovies(from: .upcoming) { [weak self] result in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self?.updateMovieData(index: Index.upcoming.rawValue, updatedData: .upcoming(titles: result.results))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        movieService.fetchMovies(from: .nowPlaying) { [weak self] result in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self?.updateMovieData(index: Index.nowPlaying.rawValue, updatedData: .nowPlaying(titles: result.results))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    
    private func updateMovieData(index: Int, updatedData: MovieData) {
        movieData[index] = updatedData
        }
}
