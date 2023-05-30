//
//  DetailView.swift
//  MovieSwiftUI
//
//  Created by Кизим Илья on 24.05.2023.
//

import SwiftUI

struct DetailView: View {
    
    var title: Title
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                ZStack {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(title.posterPath ?? "")")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .cornerRadius(8)
                    } placeholder: {
                        Color.gray
                            .frame(height: 300)
                            .cornerRadius(8)
                    }
                }
                
                Text(title.originalTitle ?? "")
                    .font(.headline)
                
                Text(title.overview ?? "")
                    .font(.body)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                HStack {
                    Button(action: {
                        // Button action
                    }) {
                        Text("Rate")
                            .foregroundColor(.white)
                            .frame(width: 100)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    Spacer().frame(width: 20)
                    Button(action: {
                        // Button action
                    }) {
                        Text("Play")
                            .foregroundColor(.white)
                            .frame(width: 100)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}
