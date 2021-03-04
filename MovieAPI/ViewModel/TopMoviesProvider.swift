//
//  TopMoviesProvider.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 26/02/2021.
//

import Foundation
import Combine

class TopMoviesProvider: ObservableObject {
    
    @Published private (set) var movies = [Movie]()
    private let movieFetcher: MovieFetcher
    
    init(movieFetcher: MovieFetcher) {
        self.movieFetcher = movieFetcher
    }
    
    func getMovies() {
        movieFetcher
            .getTopRatedMovies()
            .receive(on: RunLoop.main)
            .assign(to: &$movies)
    }
}
