//
//  ArticlesListCell+Setup.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

extension ArticlesListCell {
    
    func setupLayout() {
        let cellStackView = UIStackView(arrangedSubviews: [
            VerticalStackView(arrangedSubviews: [
                pictureImageView,
                UIView()
            ]),
            VerticalStackView(arrangedSubviews: [
                titleLabel, subtitleLabel, UIView()
            ], spacing: AppConfig.Layout.cellVItemSpacing)
        ], customSpacing: AppConfig.Layout.cellHItemSpacing)
        
        contentView.addSubviewForAutolayout(cellStackView)
        let verticalPadding = AppConfig.Layout.standatdVerticalPadding
        let horizontalPadding = AppConfig.Layout.standardHorizontalPadding
        cellStackView.fillSuperview(padding: .init(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding))
    }
}
