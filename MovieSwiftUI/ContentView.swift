//
//  ContentView.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 23.05.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mainViewModel = MainViewModel(movieService: APICaller())
    
    var body: some View {
        NavigationView {
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
}

private func sectionTitle(for data: MovieData) -> String {
    switch data {
    case .popular:
        return "Popular Movies"
    case .topRated:
        return "Top Rated Movies"
    case .upcoming:
        return "Upcoming Movies"
    case .nowPlaying:
        return "Now Playing Movies"
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

