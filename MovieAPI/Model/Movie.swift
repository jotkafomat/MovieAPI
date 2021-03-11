//
//  Movie.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 04/03/2021.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    
    var posterURL: URL? {
        let baseURL = "https://image.tmdb.org/t/p"
        let filesize = "/w92"
        let path = baseURL + filesize + posterPath
        return URL(string: path)        
    }
}
