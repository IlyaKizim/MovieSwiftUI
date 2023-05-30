//
//  SearchController.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 29.05.2023.
//

import SwiftUI

struct SearchController: View {
    @ObservedObject var searchViewModel = SearchViewModel()

    var body: some View {
        VStack {
            SearchBarView(placeHolder: Constants.placeholder, text: $searchViewModel.query) {
                searchViewModel.search(query: searchViewModel.query)
            }
            .padding(.horizontal)

            List(searchViewModel.titles, id: \.id) { title in
                SearchCellView(title: title)
            }
            .listStyle(PlainListStyle())

            Spacer()
        }
        .navigationTitle(Text(Constants.search))
        .onAppear {
            searchViewModel.query = searchViewModel.lastSearchQuery
            searchViewModel.search(query: searchViewModel.query)
        }
        .onDisappear {
            searchViewModel.lastSearchQuery = searchViewModel.query
        }
    }
}
