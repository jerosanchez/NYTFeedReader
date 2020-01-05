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
        
        let sharedStackView = VerticalStackView(arrangedSubviews: [
            sharedInLabel,
            UIStackView(arrangedSubviews: [
                twitterSourceFieldLabel, UIView(), twitterSourceSwitch
            ]),
            UIStackView(arrangedSubviews: [
                facebookSourceFieldLabel, UIView(), facebookSourceSwitch
            ])
        ], spacing: 8)
        
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
        findArticlesButton.addTarget(self, action: #selector(handleTapFindArticles), for: .touchUpInside)
    }
}
