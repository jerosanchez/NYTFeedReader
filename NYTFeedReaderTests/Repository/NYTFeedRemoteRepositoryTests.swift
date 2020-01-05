//
//  NYTFeedRemoteRepositoryTests.swift
//  NYTFeedReaderTests
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import XCTest

@testable import NYTFeedReader
class NYTFeedRemoteRepositoryTests: XCTestCase {

    // MARK: - FetchPlayers
    
    func test_FetchArticles_Viewed_UsesProperUrlString() {
        let networkingServiceSpy = NetworkingServiceSpy()
        let sut = NYTFeedRemoteRepository(networkingService: networkingServiceSpy)
        
        let expectation = XCTestExpectation(description: "Finish API call")
        
        let randomTimeWindow = TimeWindow.allCases.randomElement()!
        sut.fetchArticles(articleType: .viewed, timeWindow: randomTimeWindow, sharingSources: []) { _ in
            let expectedApiUrlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(randomTimeWindow.rawValue).json?api-key=YOUR_API_KEY"
            XCTAssertEqual(expectedApiUrlString, networkingServiceSpy.apiUrlString)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    // TODO: add more unit tests
}

// MARK: - Helpers

private class NetworkingServiceSpy: NetworkingService {
    
    // MARK: - Properties
    
    var apiUrlString: String = ""
    
    private let jsonString: String
    
    // MARK: - Initialization
    
    init(jsonString: String = "") {
        self.jsonString = jsonString
    }
    
    // MARK: - Implementation
    
    func fetch<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> ()) {
        apiUrlString = urlString
        
        if let result = try? JSONDecoder().decode(T.self, from: jsonString.data(using: .utf8)!) {
            completion(.success(result))
        } else {
            completion(.failure(NSError()))
        }
    }
}
