//
//  MovieAPIResponse.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 24/02/2021.
//

import Foundation

struct MovieAPIResponse: Decodable {
    let results: [MovieDetails]
}

struct MovieDetails: Decodable {
    let title: String
    let overview: String
    let posterPath: String
}
