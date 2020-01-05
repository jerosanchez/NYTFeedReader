//
//  ArticlesListCell.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

class ArticlesListCell: UITableViewCell {
    
    // MARK: - Subviews
    
    let pictureImageView = UIImageView(width: 60, height: 60, bkColor: .lightGray)
    let titleLabel = UILabel(font: .boldSystemFont(ofSize: 14))
    let subtitleLabel = UILabel(font: .systemFont(ofSize: 12))
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func configure(withFeedArticle feedArticle: FeedArticle) {
        titleLabel.text = feedArticle.title
        subtitleLabel.text = "\(feedArticle.author ?? "anonymus") · \(feedArticle.section ?? "") · \(feedArticle.publishedDate ?? "")"
    }
}
