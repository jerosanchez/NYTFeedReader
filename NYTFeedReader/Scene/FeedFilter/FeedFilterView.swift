//
//  FeedFilterView.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

protocol FeedFilterViewDelegate {
    func didSelectFindArticles()
}

class FeedFilterView: UIView {
    
    // MARK: - Properties
    
    var delegate: FeedFilterViewDelegate?
    
    // MARK: - Subviews
    
    let instructionsLabel = UILabel(text: "Please, select a filter criteria below:", font: .boldSystemFont(ofSize: 16))
    
    let articleTypeFieldLabel = UILabel(text: "Article type:", font: .systemFont(ofSize: 16))
    let articleTypeValueLabel = UILabel(text: "No value selected", font: .systemFont(ofSize: 14, weight: .light))
    
    let timeWindowFieldLabel = UILabel(text: "Time window:", font: .systemFont(ofSize: 16))
    let timeWindowValueLabel = UILabel(text: "No value selected", font: .systemFont(ofSize: 14, weight: .light))
    
    let sharedInLabel = UILabel(text: "Shared in:", font: .systemFont(ofSize: 16))
    
    let twitterSourceFieldLabel = UILabel(text: "Twitter", font: .systemFont(ofSize: 16))
    let twitterSourceSwitch = UISwitch()
    
    let facebookSourceFieldLabel = UILabel(text: "Facebook", font: .systemFont(ofSize: 16))
    let facebookSourceSwitch = UISwitch()
    
    let findArticlesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Find articles", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupLayout()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
