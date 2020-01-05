//
//  NYTFeedRepository.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

enum ArticleType: String, CaseIterable {
    case emailed
    case viewed
    case shared
}

enum TimeWindow: Int, CaseIterable {
    case oneDayAgo = 1
    case oneWeekAgo = 7
    case oneMonthAgo = 30
}

enum SharingSource: String, CaseIterable {
    case twitter
    case facebook
}

protocol NYTFeedRepository {
    func fetchArticles(articleType: ArticleType, timeWindow: TimeWindow, sharingSources: [SharingSource], completion: @escaping (Result<[FeedArticle], Error>) -> ())
}
