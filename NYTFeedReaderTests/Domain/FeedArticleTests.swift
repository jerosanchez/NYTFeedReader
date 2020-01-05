//
//  FeedArticleTests.swift
//  NYTFeedReaderTests
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import XCTest

@testable import NYTFeedReader
class FeedArticleTests: XCTestCase {

    // MARK: - Init

    func test_Init_GivenArticleURL_SetsArticleUrl() {
        let randomArticleURL = UUID().description
        
        let sut = makeSutWith(articleURL: randomArticleURL)
        
        XCTAssertEqual(randomArticleURL, sut.articleURL)
    }
    
    func test_Init_GivenTitle_SetsTitle() {
        let randomTitle = UUID().description
        
        let sut = makeSutWith(title: randomTitle)
        
        XCTAssertEqual(randomTitle, sut.title)
    }
    
    func test_Init_GivenAuthor_SetsAuthor() {
        let randomAuthor = UUID().description
        
        let sut = makeSutWith(author: randomAuthor)
        
        XCTAssertEqual(randomAuthor, sut.author)
    }
    
    func test_Init_GivenSection_SetsSection() {
        let randomSection = UUID().description
        
        let sut = makeSutWith(section: randomSection)
        
        XCTAssertEqual(randomSection, sut.section)
    }
    
    func test_Init_GivenPublishedDate_SetsPublishedDate() {
        let randomPublishedDate = UUID().description
        
        let sut = makeSutWith(publishedDate: randomPublishedDate)
        
        XCTAssertEqual(randomPublishedDate, sut.publishedDate)
    }
    
    func test_Init_GivenJSON_DecodesCorrectly() {
        let feedArticle = try? JSONDecoder().decode(FeedArticle.self, from: jsonFeedArticle())
        
        XCTAssertNotNil(feedArticle, "could not decode JSON feed article")
    }
    
    // MARK: - Helpers
    
    private func makeSutWith(
        articleURL: String? = UUID().description,
        title: String? = UUID().description,
        author: String? = UUID().description,
        section: String? = UUID().description,
        publishedDate: String? = UUID().description) -> FeedArticle {
        
        return FeedArticle(articleURL: articleURL, title: title, author: author, section: section, publishedDate: publishedDate)
    }
    
    private func jsonFeedArticle() -> Data {
        let jsonString = """
        {
          "url": "https://www.nytimes.com/2019/12/27/us/navy-seals-edward-gallagher-video.html",
          "section": "U.S.",
          "byline": "By DAVE PHILIPPS",
          "title": "Anguish and Anger From the Navy SEALs Who Turned In Edward Gallagher",
          "published_date": "2019-12-27",
          "media": [
            {
              "type": "image",
              "media-metadata": [
                {
                  "url": "https://static01.nyt.com/images/2019/12/23/us/00SEALS-gallagher/00SEALS-gallagher-square320.jpg",
                  "format": "square320",
                  "height": 320,
                  "width": 320
                },
                {
                  "url": "https://static01.nyt.com/images/2019/12/23/us/00SEALS-gallagher/00SEALS-gallagher-thumbStandard.jpg",
                  "format": "Standard Thumbnail",
                  "height": 75,
                  "width": 75
                }
              ]
            }
          ]
        }
        """
        return jsonString.data(using: .utf8)!
    }
}
