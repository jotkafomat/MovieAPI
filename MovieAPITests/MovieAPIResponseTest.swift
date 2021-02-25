//
//  MovieAPIResponseTest.swift
//  MovieAPITests
//
//  Created by Krzysztof Jankowski on 24/02/2021.
//

import XCTest
@testable import MovieAPI

class MovieAPIResponseTest: XCTestCase {
    
    var data: Data!

    override func setUpWithError() throws {
        data = try Data(from: "movieAPI")
    }

    override func tearDownWithError() throws {
        data = nil
    }

    func testInitFromJson() throws {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let response = try decoder.decode(MovieAPIResponse.self, from: data)
        XCTAssertEqual(response.results.count, 1)
        
        let movie = try XCTUnwrap(response.results.first)
        XCTAssertEqual(movie.title, "The Godfather")
        XCTAssertEqual(movie.overview, "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
        XCTAssertEqual(movie.posterPath, "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
    }
    
}
