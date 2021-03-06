//
//  TopMoviesProviderTest.swift
//  MovieAPITests
//
//  Created by Krzysztof Jankowski on 26/02/2021.
//
import Combine
import Foundation
import XCTest
@testable import MovieAPI

class TopMoviesProviderTest: XCTestCase {
    
    var subject: TopMoviesProvider!
    var cancellable: AnyCancellable?

    override func setUpWithError() throws {
        subject = TopMoviesProvider(movieFetcher: MockMovieFetcher.succesful)
    }

    override func tearDownWithError() throws {
        subject = nil
        cancellable?.cancel()
    }

    func testMovieProviderSucceess() throws {
        let expectation = XCTestExpectation(description: "expect movies not be empty")
        
        cancellable = subject
            .$movies
            .dropFirst()
            .sink {
                movies in
                XCTAssertEqual(movies.first?.title, "The Godfather")
                expectation.fulfill()
            }
        subject.getMovies()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testMovieProviderFails() throws {
        let expectation = XCTestExpectation(description: "expect movies to be empty")
        subject = TopMoviesProvider(movieFetcher: MockMovieFetcher.errorProne)
        cancellable = subject
            .$movies
            .dropFirst()
            .sink {
                movies in
                XCTAssert(movies.isEmpty)
                expectation.fulfill()
            }
        subject.getMovies()
        wait(for: [expectation], timeout: 1.0)
    }

}
