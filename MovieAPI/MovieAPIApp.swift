//
//  MovieAPIApp.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 24/02/2021.
//

import SwiftUI

@main
struct MovieAPIApp: App {
    var topMovieProvider = TopMoviesProvider(movieFetcher: MovieAPI())
    
    var body: some Scene {
        WindowGroup {
            ContentView(topMovies: topMovieProvider)
        }
    }
}
