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
        Text("Detail Screen: \(title.originalTitle ?? "")")
    }
}
