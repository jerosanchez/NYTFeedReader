//
//  FeedFilterNavigator.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

extension AppNavigator: FeedFilterNavigationLogic {
    
    func navigateToArticlesList() {
        let viewController = ArticlesListController()
        navController?.pushViewController(viewController, animated: true)
    }
}
