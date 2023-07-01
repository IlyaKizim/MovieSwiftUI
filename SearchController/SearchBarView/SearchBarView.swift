//
//  SearchBarView.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 29.05.2023.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    
    let placeHolder: String
    @Binding var text: String
    var onSearchButtonTapped: (() -> Void)?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, onSearchButtonTapped: onSearchButtonTapped)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = placeHolder
        searchBar.searchBarStyle = .minimal
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        var onSearchButtonTapped: (() -> Void)?
        
        init(text: Binding<String>, onSearchButtonTapped: (() -> Void)?) {
            _text = text
            self.onSearchButtonTapped = onSearchButtonTapped
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
            onSearchButtonTapped?()
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            onSearchButtonTapped?()
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
}

