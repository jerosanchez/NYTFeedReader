//
//  FeedFilterCriteriaTests.swift
//  NYTFeedReaderTests
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import XCTest

@testable import NYTFeedReader
class FeedFilterCriteriaTests: XCTestCase {

    // MARK: - Init

    func test_Init_GivenArticleType_SetsArticleType() {
        let randomArticleType = ArticleType.allCases.randomElement()!
        
        let sut = makeSutWith(articleType: randomArticleType)
        
        XCTAssertEqual(randomArticleType, sut.articleType)
    }
    
    func test_Init_GivenSharingSources_SetsShharingSources() {
        let randomSharingSources = [ SharingSource.allCases.randomElement()!]
        
        let sut = makeSutWith(sharingSources: randomSharingSources)
        
        XCTAssertEqual(randomSharingSources, sut.sharingSources)
    }
    
    func test_Init_GivenTimeWindow_SetsTimeWindow() {
        let randomTimeWindow = TimeWindow.allCases.randomElement()!
        
        let sut = makeSutWith(timeWindow: randomTimeWindow)
        
        XCTAssertEqual(randomTimeWindow, sut.timeWindow)
    }
    
    // MARK: - Helpers
    
    private func makeSutWith(
        articleType: ArticleType = ArticleType.allCases.randomElement()!,
        sharingSources: [SharingSource]? = nil,
        timeWindow: TimeWindow = TimeWindow.allCases.randomElement()!) -> FeedFilterCriteria {
        
        return FeedFilterCriteria(articleType: articleType, sharingSources: sharingSources, timeWindow: timeWindow)
    }
}
