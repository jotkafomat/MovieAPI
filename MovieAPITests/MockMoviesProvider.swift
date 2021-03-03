//
//  MockMoviesProvider.swift
//  MovieAPITests
//
//  Created by Krzysztof Jankowski on 26/02/2021.
//

import Foundation
import Combine
@testable import MovieAPI

enum MockMovieProvider: MovieProvider {
    
    case errorProne
    case succesful
    
    
    func getMovieDetails() -> AnyPublisher<[MovieDetails], Never> {
        switch self {
        case .errorProne:
            return Just<[MovieDetails]>([]).eraseToAnyPublisher()
        case .succesful:
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let data = try? Data(from: "movieAPI")
            let response = try? decoder.decode(MovieAPIResponse.self, from: data!)
            return Just<[MovieDetails]>(response?.results ?? []).eraseToAnyPublisher()
        }
    }
    
    
}

