//
//  FeedArticleMediaTests.swift
//  NYTFeedReaderTests
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import XCTest

@testable import NYTFeedReader
class FeedArticleMediaTests: XCTestCase {

    // MARK: - Init

    func test_Init_GivenType_SetsType() {
        let randomType = UUID().description
        
        let sut = makeSutWith(type: randomType)
        
        XCTAssertEqual(randomType, sut.type)
    }
    
    func test_Init_GivenMetadata_SetsMetadata() {
        let randomMetadata = makeRandomMediaMetadata()
        
        let sut = makeSutWith(metadata: randomMetadata)
        
        XCTAssertEqual(randomMetadata, sut.metadata)
    }
    
    func test_Init_GivenJSON_DecodesCorrectly() {
        let feedArticle = try? JSONDecoder().decode(FeedArticleMedia.self, from: jsonFeedArticleMedia())
        
        XCTAssertNotNil(feedArticle, "could not decode JSON feed article media")
    }
    
    // MARK: - Helpers
    
    private func makeSutWith(
        type: String? = UUID().description,
        metadata: [MediaMetadata]? = nil) -> FeedArticleMedia {
        
        if let metadata = metadata {
            return FeedArticleMedia(type: type, metadata: metadata)
        } else {
           return FeedArticleMedia(type: type, metadata: makeRandomMediaMetadata())
        }
    }
    
    private func makeRandomMediaMetadata() -> [MediaMetadata] {
        var metadata = [MediaMetadata]()
        for _ in 1...Int.random(in: 1...10) {
            metadata.append(MediaMetadata(urlString: UUID().description))
        }
        return metadata
    }
    
    private func jsonFeedArticleMedia() -> Data {
        let jsonString = """
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
        """
        return jsonString.data(using: .utf8)!
    }
}
