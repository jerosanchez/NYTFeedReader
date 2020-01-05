//
//  AppConfig+Literals.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

extension AppConfig {
        
    struct FeedFilter {
        static let sceneTitleText = NSLocalizedString("Filter", comment: "")
        
        static let helpText = NSLocalizedString("Please, select a filter criteria below:", comment: "")
        
        static let articleTypeLabelText = NSLocalizedString("Article type:", comment: "")
        static let sharedInLabelText = NSLocalizedString("Shared in:", comment: "")
        static let twitterLabelText = NSLocalizedString("Twitter", comment: "")
        static let facebookLabelText = NSLocalizedString("Facebook", comment: "")
        static let timeWindowLabelText = NSLocalizedString("Time window:", comment: "")
        static let findArticlesButtonTitle = NSLocalizedString("Find Articles", comment: "")
        
        static let timeWindow1 = NSLocalizedString("last day", comment: "")
        static let timeWindow7 = NSLocalizedString("last week", comment: "")
        static let timeWindow30 = NSLocalizedString("last month", comment: "")
        
        static let articleTypePickerHelpText = NSLocalizedString("Select article type:", comment: "")
        static let timeWindowPickerHelpText = NSLocalizedString("Select time window:", comment: "")
    }
}
