//
//  Constants.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 23.05.2023.
//

import Foundation

enum Constants {
    static let APIKey = "1d80d5a6ac5851a945e7c8f5add7fca2"
    static let basicURL = "https://api.themoviedb.org"
    static let jsonDecoder = Utils.jsonDecoder
    static let urlSession = URLSession.shared
    static let popular = "Popular Movies"
    static let topRated = "Top Rated Movies"
    static let upcoming = "Upcoming Movies"
    static let nowPlaying = "Now Playing Movies"
    static let movie = "Movie"
    static let search = "Search"
    static let itemMovie = "film"
    static let itemSearch = "magnifyingglass"
    static let placeholder = "Search movie"
}
