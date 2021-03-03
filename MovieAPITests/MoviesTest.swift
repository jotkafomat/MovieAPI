//
//  MoviesTest.swift
//  MovieAPITests
//
//  Created by Krzysztof Jankowski on 26/02/2021.
//
import Combine
import Foundation
import XCTest
@testable import MovieAPI

class MoviesTest: XCTestCase {
    
    var movies: Movies!
    var cancellable: AnyCancellable?

    override func setUpWithError() throws {
        movies = Movies(movieProvider: MockMovieProvider.succesful)
    }

    override func tearDownWithError() throws {
        movies = nil
        cancellable?.cancel()
    }

    func testMovieProviderSucceess() throws {
        let expectation = XCTestExpectation(description: "expect movies not be nil")
        
        cancellable = movies
            .$moviesArray
            .dropFirst()
            .sink {
                values in
                XCTAssertEqual(values.first?.title, "The Godfather")
                expectation.fulfill()
            }
        movies.getMovies()
        wait(for: [expectation], timeout: 1.0)
    }

}
