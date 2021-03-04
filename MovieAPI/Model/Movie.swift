//
//  Movie.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 04/03/2021.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let overview: String
    let posterPath: String
}
