//
//  ArticlesListAssembly.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

extension DependencyContainer {
    
    static var articlesListController: ArticlesListController {
        return ArticlesListController(
            dataSource: articlesListDataSource,
            viewModel: articlesListViewModel)
    }
    
    static var articlesListDataSource: ArticlesListDataSource {
        return ArticlesListDataSource()
    }
    
    static var articlesListViewModel: ArticlesListViewModel {
        return ArticlesListViewModel(
            repository: nytFeedRepository)
    }
}
