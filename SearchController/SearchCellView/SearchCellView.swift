//
//  SearchCellView.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 29.05.2023.
//

import SwiftUI

struct SearchCellView: View {
    let title: Title
    
    var body: some View {
        NavigationLink(destination: DetailView(title: title)) {
            HStack(spacing: 1) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(title.posterPath ?? "")")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 100)
                        .cornerRadius(8)
                } placeholder: {
                    Color.gray
                        .frame(width: 80, height: 140)
                        .cornerRadius(8)
                }
                Spacer()
                Text(title.originalTitle ?? "")
                    .font(.caption)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .tint(Color(.black))
            }
            .frame(height: 100)
        }
    }
}
