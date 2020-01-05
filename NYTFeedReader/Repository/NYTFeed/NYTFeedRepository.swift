//
//  NYTFeedRepository.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

protocol NYTFeedRepository {
    func fetchArticles(articleType: ArticleType, timeWindow: TimeWindow, sharingSources: [SharingSource], completion: @escaping (Result<[FeedArticle], Error>) -> ())
}
