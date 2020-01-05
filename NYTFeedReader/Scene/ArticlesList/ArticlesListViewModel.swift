//
//  ArticlesListViewModel.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

class ArticlesListViewModel {
    
    // MARK: - Properties
    
    var feedArticles = Observable<[FeedArticle]>(value: [])
    
    var loadingError = Observable<Error?>(value: nil)
    
    // MARK: - Dependencies
    
    private let repository: NYTFeedRepository
    
    // MARK: - Initialization
    
    init(repository: NYTFeedRepository) {
        self.repository = repository
    }
    
    // MARK: - API
    
    func loadArticles(using filterCriteria: FeedFilterCriteria?) {
        guard let filterCriteria = filterCriteria else { return }
        
        repository.fetchArticles(
            articleType: filterCriteria.articleType,
            timeWindow: filterCriteria.timeWindow,
            sharingSources: filterCriteria.sharingSources) { result in
            
            switch result {
            case .success(let feedArticles):
                self.feedArticles.value = feedArticles
            case .failure(let error):
                self.loadingError.value = error
            }
        }
    }
}
