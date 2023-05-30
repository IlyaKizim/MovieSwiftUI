//
//  MainViewController.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 29.05.2023.
//

import SwiftUI

struct MainViewController: View {
    
    @ObservedObject var mainViewModel = MainViewModel(movieService: APICaller())
    
    var body: some View {
            List {
                ForEach(mainViewModel.movieData, id: \.id) { data in
                    Section(header: Text(sectionTitle(for: data))) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 5) {
                                ForEach(data.titles, id: \.id) { title in
                                    CellView(title: title)
                                }
                            }
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 1, leading: 0, bottom: 10, trailing: 0))
                }
            }
    }
}

private func sectionTitle(for data: MovieData) -> String {
    switch data {
    case .popular:
        return Constants.popular
    case .topRated:
        return Constants.topRated
    case .upcoming:
        return Constants.upcoming
    case .nowPlaying:
        return Constants.nowPlaying
    }
}
