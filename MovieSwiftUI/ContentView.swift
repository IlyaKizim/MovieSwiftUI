//
//  ContentView.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 23.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab: Int? = 1
    
    var body: some View {
        NavigationView {
            if activeTab == 1 {
                MainViewController()
                    .navigationBarTitle(Constants.movie)
            } else if activeTab == 2 {
                SearchController()
                    .navigationBarTitle(Constants.search)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button(action: {
                    activeTab = 1
                }) {
                    Image(systemName: Constants.itemMovie)
                }
                .padding(50)
                
                Spacer()
                
                Button(action: {
                    activeTab = 2
                }) {
                    Image(systemName: Constants.itemSearch)
                }
                .padding(50)
                
                Spacer()
            }
        }
        .foregroundColor(Color(.black))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
