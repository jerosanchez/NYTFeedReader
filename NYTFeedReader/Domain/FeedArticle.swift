//
//  FeedArticle.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

struct FeedArticle {
    let articleURL: String?
    let title: String?
    let author: String?
    let section: String?
    let publishedDate: String?
}

extension FeedArticle: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case articleUrl = "url"
        case title
        case author = "byline"
        case section
        case publishedDate = "published_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.articleURL = try? container.decode(String.self, forKey: .articleUrl)
        self.title = try? container.decode(String.self, forKey: .title)
        self.author = try? container.decode(String.self, forKey: .author)
        self.section = try? container.decode(String.self, forKey: .section)
        self.publishedDate = try? container.decode(String.self, forKey: .publishedDate)
    }
}
