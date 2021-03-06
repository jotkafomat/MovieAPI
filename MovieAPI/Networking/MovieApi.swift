//
//  MovieApi.swift
//  MovieAPI
//
//  Created by Krzysztof Jankowski on 25/02/2021.
//


import Foundation
import Combine

protocol MovieFetcher {
    func getTopRatedMovies() -> AnyPublisher<[Movie], Never>
}

class MovieAPI: MovieFetcher {
    
    private let session: URLSession
    private let baseUrl: URL
    
    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    public init(session: URLSession = URLSession.shared, baseUrl: URL = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=06c477fb6235927e8e8ea7e96b18133c")!) {
        self.session = session
        self.baseUrl = baseUrl
    }
    
    func getTopRatedMovies() -> AnyPublisher<[Movie], Never> {
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        
        return session
            .dataTaskPublisher(for: request) //publish data and response or url error Pub<(Data, URLResponse), URLError>
            .map { $0.data } //publish data
            .decode(type: MovieAPIResponse.self, decoder: MovieAPI.decoder) // publish MovirAPIResponse
            .map { $0.results } // publish [Movie]
            .catch { _ in Just<[Movie]>([]) } // replace error with empty []
            .eraseToAnyPublisher()
    }
    
}

