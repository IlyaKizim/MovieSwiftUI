//
//  CellView.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 24.05.2023.
//

import SwiftUI

struct CellView: View {
    let title: Title
    
    var body: some View {
        NavigationLink(destination: DetailView(title: title)) {
            VStack(spacing: 1) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(title.posterPath ?? "")")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 140)
                        .cornerRadius(8)
                } placeholder: {
                    Color.gray
                        .frame(width: 80, height: 140)
                        .cornerRadius(8)
                }
                
                Text(title.originalTitle ?? "")
                    .font(.caption)
                    .frame(width: 80)
                    .multilineTextAlignment(.center)
                    .tint(Color(.black))
            }
            .frame(height: 160)
        }
    }
}
