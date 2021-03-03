//
//  Movies.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 26/02/2021.
//

import Foundation
import Combine

class Movies: ObservableObject {
    
    @Published private (set) var moviesArray = [MovieDetails]()
    private let movieProvider: MovieProvider
    
    init(movieProvider: MovieProvider) {
        self.movieProvider = movieProvider
    }
    
    func getMovies() {
        movieProvider
            .getMovieDetails()
            .receive(on: RunLoop.main)
            .assign(to: &$moviesArray)
    }
}
