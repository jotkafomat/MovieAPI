//
//  MockMoviesFetcher.swift
//  MovieAPITests
//
//  Created by Krzysztof Jankowski on 26/02/2021.
//

import Foundation
import Combine
@testable import MovieAPI

enum MockMovieFetcher: MovieFetcher {
    
    case errorProne
    case succesful
    
    func getTopRatedMovies() -> AnyPublisher<[Movie], Never> {
        switch self {
        case .errorProne:
            return Just<[Movie]>([]).eraseToAnyPublisher()
        case .succesful:
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let data = try? Data(from: "movieAPI")
            let response = try? decoder.decode(MovieAPIResponse.self, from: data!)
            return Just<[Movie]>(response?.results ?? []).eraseToAnyPublisher()
        }
    }
    
    
}

