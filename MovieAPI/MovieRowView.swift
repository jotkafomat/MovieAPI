//
//  MovieRowView.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 08/03/2021.
//

import SwiftUI
import Kingfisher

struct MovieRow: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Color(.separator)
                .frame(height: 1)
            HStack(alignment: .top) {
                KFImage(movie.posterURL)
                    .placeholder {
                        PlaceholderPoster()
                    }
                Text(movie.title)
                    .font(.title)
            }
            Text(movie.overview)
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .lineLimit(6)
                .padding(.trailing)
        }
        .padding(.leading)
    }
}
