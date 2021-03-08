//
//  ContentView.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 24/02/2021.
//

import SwiftUI
import Kingfisher


struct ContentView: View {
    @ObservedObject var topMovies: TopMoviesProvider
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(topMovies.movies) { movie in
                        MovieRow(movie: movie)
                    }
                }
                .onAppear{
                    topMovies.getMovies()
                }
            }
            .navigationTitle("Top Movies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var topMovieProvider = TopMoviesProvider(movieFetcher: MovieAPI())
    static var previews: some View {
        ContentView(topMovies: topMovieProvider)
    }
}
