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
            Color.secondary
                .frame(height: 1)
            HStack(alignment: .top) {
                KFImage(URL(string: movie.posterURL))
                Text(movie.title)
                    .font(.title)
            }
            Text(movie.overview)
                .font(.footnote)
                .fontWeight(.light)
                .lineLimit(6)
                .padding(.trailing)
        }
        .padding(.leading)
    }
}
