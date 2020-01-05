//
//  ArticlesListNavigator.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

extension AppNavigator: ArticlesListNavigationLogic {
    
    func navigateToArticleDetail(feedArticle: FeedArticle) {
        let viewController = ArticleDetailController()
        viewController.navigator = self
        viewController.feedArticle = feedArticle
        navController?.pushViewController(viewController, animated: true)
    }
}
