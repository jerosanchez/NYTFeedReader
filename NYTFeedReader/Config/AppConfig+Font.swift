//
//  AppConfig+Font.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

extension AppConfig {
    
    struct Font {
        
        static let formHelpLabel = UIFont.boldSystemFont(ofSize: 16)
        static let formFieldLabel = UIFont.systemFont(ofSize: 16)
        static let formFieldValue = UIFont.systemFont(ofSize: 14, weight: .light)
        
        static let formButtonTitle = UIFont.boldSystemFont(ofSize: 18)
        
        static let listItemTitle = UIFont.boldSystemFont(ofSize: 14)
        static let listItemSubtitle = UIFont.systemFont(ofSize: 12)
    }
}
