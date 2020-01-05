//
//  AppDelegate.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let homeController = FeedFilterController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeController
        window?.makeKeyAndVisible()
        
        return true
    }
}
