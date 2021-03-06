//
//  AppConfig.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

struct AppConfig {
    
    static let defaultFilterCriteria = FeedFilterCriteria(
        articleType: .viewed,
        sharingSources: [SharingSource](),
        timeWindow: .oneDayAgo)
}
