//
//  FeedFilterView+Setup.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

extension FeedFilterView {
    
    func setupView() {
        backgroundColor = .white
        
        articleTypeValueLabel.textAlignment = .right
        timeWindowValueLabel.textAlignment = .right
    }
    
    func setupLayout() {
        
        let articleTypeStackView = UIStackView(arrangedSubviews: [
            articleTypeFieldLabel, UIView(), articleTypeValueLabel
        ])
        
        let timeWindowStackView = UIStackView(arrangedSubviews: [
            timeWindowFieldLabel, UIView(), timeWindowValueLabel
        ])
        
        let stackView = VerticalStackView(arrangedSubviews: [
            instructionsLabel,
            articleTypeStackView,
            sharedStackView,
            timeWindowStackView,
            findArticlesButton,
            UIView()
        ], spacing: 32)
        
        addSubviewForAutolayout(stackView)
        stackView.fillSuperview(padding: .init(top: 16 + 100, left: 16, bottom: 16, right: 16))
    }
    
    func setupActions() {
        let tapArticleTypeGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapArticleType))
        articleTypeValueLabel.addGestureRecognizer(tapArticleTypeGesture)
        articleTypeValueLabel.isUserInteractionEnabled = true
        
        twitterSourceSwitch.addTarget(self, action: #selector(handleTapTwitterSwitch), for: .valueChanged)
        facebookSourceSwitch.addTarget(self, action: #selector(handleTapFacebookSwitch), for: .valueChanged)

        let tapTimeWindowGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapTimeWindow))
        timeWindowValueLabel.addGestureRecognizer(tapTimeWindowGesture)
        timeWindowValueLabel.isUserInteractionEnabled = true
        
        findArticlesButton.addTarget(self, action: #selector(handleTapFindArticles), for: .touchUpInside)
    }
}
