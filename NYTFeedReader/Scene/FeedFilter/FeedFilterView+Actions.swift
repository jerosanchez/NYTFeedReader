//
//  FeedFilterView+Actions.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

extension FeedFilterView {
    
    @objc func handleTapArticleType(_ sender: UITapGestureRecognizer?) {
        delegate?.didSelectChangeArticleType()
    }
    
    @objc func handleTapTwitterSwitch() {
        delegate?.didSelectTwitterSwitch(isOn: twitterSourceSwitch.isOn)
    }
    
    @objc func handleTapFacebookSwitch() {
        delegate?.didSelectFacebookSwitch(isOn: facebookSourceSwitch.isOn)
    }
    
    @objc func handleTapTimeWindow(_ sender: UITapGestureRecognizer?) {
        delegate?.didSelectChangeTimeWindow()
    }
    
    @objc func handleTapFindArticles() {
        delegate?.didSelectFindArticles()
    }
}
