//
//  MockURLProtocol.swift
//  MovieAPITests
//
//  Created by Krzysztof Jankowski on 25/02/2021.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var requestHandler: ((URLRequest) -> (HTTPURLResponse, Data?))!
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        let (response, data) = MockURLProtocol.requestHandler(request)
        
        client?.urlProtocol(self,
                            didReceive: response,
                            cacheStoragePolicy: .notAllowed)
        if let data = data {
            client?.urlProtocol(self, didLoad: data)
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
