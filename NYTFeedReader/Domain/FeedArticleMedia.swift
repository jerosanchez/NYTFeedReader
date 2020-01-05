//
//  FeedArticleMedia.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

struct FeedArticleMedia: Equatable {
    let type: String?
    let metadata: [MediaMetadata]?
}

extension FeedArticleMedia: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case type
        case metadata = "media-metadata"
    }
}

struct MediaMetadata: Decodable, Equatable {
    let urlString: String
    
    enum CodingKeys: String, CodingKey {
        case urlString = "url"
    }
}
