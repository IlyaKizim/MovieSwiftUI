//
//  SearchViewModel.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 29.05.2023.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var query = ""
    @Published var titles: [Title] = []
    @Published var isLoading = false
    @Published var error: NSError?
    var lastSearchQuery: String = ""
    
    let movieService: MovieService
    
    init(movieService: MovieService = APICaller()) {
        self.movieService = movieService
    }
    
    func search(query: String) {
        self.titles = []
        self.error = nil
        self.isLoading = false
        
        guard !query.isEmpty else { return }
        self.isLoading = true
        self.movieService.search(with: query) { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.titles = response.results
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}


