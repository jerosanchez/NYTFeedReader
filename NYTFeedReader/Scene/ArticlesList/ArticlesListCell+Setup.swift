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
            ], spacing: 8)
        ], customSpacing: 16)
        
        contentView.addSubviewForAutolayout(cellStackView)
        cellStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
}
