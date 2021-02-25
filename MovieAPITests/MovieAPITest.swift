//
//  MovieAPITest.swift
//  MovieAPITests
//
//  Created by Krzysztof Jankowski on 25/02/2021.
//

import XCTest
@testable import MovieAPI
import Combine


class MovieAPITest: XCTestCase {
    
    var api: MovieAPI!
    let baseUrl = URL(string: "https://just.test/")
    var cancellable: AnyCancellable?
    

    override func setUpWithError() throws {
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        
        api = MovieAPI(session: session, baseUrl: baseUrl!)
    }

    override func tearDownWithError() throws {
        api = nil
        MockURLProtocol.requestHandler = nil
        cancellable?.cancel()
    }

    func testGetMovieDetailsWhenRequestSuccess() throws {
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: self.baseUrl!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let data = try! Data(from: "movieAPI")
            return (response, data)
        }
        
        let moviesLoaded = expectation(description: "movies get loaded")
        
        cancellable = api.getMovieDetails().sink { movies in
            XCTAssertEqual(movies.count, 1)
            XCTAssertEqual(movies[0].title, "The Godfather")
            moviesLoaded.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
    
    func testGetMovieDetailsWhenRequestFails() throws {
        MockURLProtocol.requestHandler = { _ in
            let response = HTTPURLResponse(url: self.baseUrl!, statusCode: 404, httpVersion: nil, headerFields: nil)!
            return (response, nil)
        }
        
        let moviesNotLoaded = expectation(description: "movies not loaded")
        
        cancellable = api.getMovieDetails().sink { movies in
            XCTAssertTrue(movies.isEmpty)
            moviesNotLoaded.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
}
