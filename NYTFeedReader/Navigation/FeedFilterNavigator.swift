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
        let viewController = DependencyContainer.articlesListController
        viewController.navigator = self
        navController?.pushViewController(viewController, animated: true)
    }
}
