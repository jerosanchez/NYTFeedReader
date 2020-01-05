//
//  AppNavigator.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

class AppNavigator {
    
    // MARK: - Properties
    
    private(set) var window: UIWindow?
    private(set) var navController: UINavigationController?
    
    // MARK: - API
    
    func start() {
        // Initialize homeController with a
        // different controller to change how the app starts
        let homeController = DependencyContainer.feedFilterController
        homeController.navigator = self
        navController = UINavigationController(rootViewController: homeController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
