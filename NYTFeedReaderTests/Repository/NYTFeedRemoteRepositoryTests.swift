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
        let randomTimeWindow = TimeWindow.allCases.randomElement()!
        
        let expectedUrlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(randomTimeWindow.rawValue).json?api-key=\(AppConfig.Secrets.NYTApiKey)"
        assertUrlString(articleType: .viewed, timeWindow: randomTimeWindow, sharingSources: [], expectedUrlString: expectedUrlString)
    }
    
    func test_FetchArticles_Emailed_UsesProperUrlString() {
        let randomTimeWindow = TimeWindow.allCases.randomElement()!
        
        let expectedUrlString = "https://api.nytimes.com/svc/mostpopular/v2/emailed/\(randomTimeWindow.rawValue).json?api-key=\(AppConfig.Secrets.NYTApiKey)"
        assertUrlString(articleType: .emailed, timeWindow: randomTimeWindow, sharingSources: [], expectedUrlString: expectedUrlString)
    }
    
    func test_FetchArticles_SharedWithNoSharingSource_UsesProperUrlString() {
        let randomTimeWindow = TimeWindow.allCases.randomElement()!
        
        let expectedUrlString = "https://api.nytimes.com/svc/mostpopular/v2/shared/\(randomTimeWindow.rawValue).json?api-key=\(AppConfig.Secrets.NYTApiKey)"
        assertUrlString(articleType: .shared, timeWindow: randomTimeWindow, sharingSources: [], expectedUrlString: expectedUrlString)
    }
    
    func test_FetchArticles_SharedWithOneSharingSource_UsesProperUrlString() {
        let randomTimeWindow = TimeWindow.allCases.randomElement()!
        let randomSharingSource = SharingSource.allCases.randomElement()!
        
        let expectedUrlString = "https://api.nytimes.com/svc/mostpopular/v2/shared/\(randomTimeWindow.rawValue)/\(randomSharingSource.rawValue).json?api-key=\(AppConfig.Secrets.NYTApiKey)"
        assertUrlString(articleType: .shared, timeWindow: randomTimeWindow, sharingSources: [randomSharingSource], expectedUrlString: expectedUrlString)
    }
    
    func test_FetchArticles_SharedWithTwoSharingSources_UsesProperUrlString() {
        let randomTimeWindow = TimeWindow.allCases.randomElement()!
        
        let expectedUrlString = "https://api.nytimes.com/svc/mostpopular/v2/shared/\(randomTimeWindow.rawValue).json?api-key=\(AppConfig.Secrets.NYTApiKey)"
        assertUrlString(articleType: .shared, timeWindow: randomTimeWindow, sharingSources: [.twitter, .facebook], expectedUrlString: expectedUrlString)
    }
    
    func test_FetchArticles_ReturnsFeedArticles() {
        let networkingServiceSpy = NetworkingServiceSpy(jsonString: jsonFeedArticles())
        let sut = NYTFeedRemoteRepository(networkingService: networkingServiceSpy)
        
        let expectation = XCTestExpectation(description: "Finish API call")
        sut.fetchArticles(articleType: .viewed, timeWindow: .oneDayAgo, sharingSources: []) { result in
            switch result {
            case .success(let feedArticles):
                XCTAssertEqual(1, feedArticles.count)
                XCTAssertEqual(1, feedArticles.first!.media?.count)
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}

// MARK: - Helpers

extension NYTFeedRemoteRepositoryTests {
    
    private func assertUrlString(articleType: ArticleType, timeWindow: TimeWindow, sharingSources: [SharingSource], expectedUrlString: String, file: StaticString = #file, line: UInt = #line) {
        
        let networkingServiceSpy = NetworkingServiceSpy()
        let sut = NYTFeedRemoteRepository(networkingService: networkingServiceSpy)
        
        let expectation = XCTestExpectation(description: "Finish API call")
        
        sut.fetchArticles(articleType: articleType, timeWindow: timeWindow, sharingSources: sharingSources) { _ in
            XCTAssertEqual(expectedUrlString, networkingServiceSpy.apiUrlString, file: file, line: line)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    private func jsonFeedArticles() -> String {
        return """
        {
          "results": [
            {
              "url": "https://www.nytimes.com/2020/01/03/world/middleeast/iranian-general-qassem-soleimani-killed.html",
              "section": "World",
              "byline": "",
              "type": "Article",
              "title": "The Killing of Gen. Qassim Suleimani: What We Know Since the U.S. Airstrike",
              "published_date": "2020-01-03",
              "media": [
                {
                  "type": "image",
                  "media-metadata": [
                    {
                      "url": "https://static01.nyt.com/images/2020/01/03/world/03iraq-briefing-span/merlin_166605342_bb1d07c1-25be-4a96-8815-857e98b24a47-square320.jpg"
                    }                  ]
                }
              ]
            }
          ]
        }
        """
    }
}

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
