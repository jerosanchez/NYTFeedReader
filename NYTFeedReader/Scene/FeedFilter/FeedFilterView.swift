//
//  FeedFilterView.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

protocol FeedFilterViewDelegate {
    func didSelectChangeArticleType()
    func didSelectChangeTimeWindow()
    func didSelectTwitterSwitch(isOn: Bool)
    func didSelectFacebookSwitch(isOn: Bool)
    func didSelectFindArticles()
}

class FeedFilterView: UIView {
    
    // MARK: - Properties
    
    var delegate: FeedFilterViewDelegate?
    
    // MARK: - Subviews
    
    let instructionsLabel = UILabel(text: "Please, select a filter criteria below:", font: .boldSystemFont(ofSize: 16))
    
    let articleTypeFieldLabel = UILabel(text: "Article type:", font: .systemFont(ofSize: 16))
    let articleTypeValueLabel = UILabel(font: .systemFont(ofSize: 14, weight: .light))
    
    let timeWindowFieldLabel = UILabel(text: "Time window:", font: .systemFont(ofSize: 16))
    let timeWindowValueLabel = UILabel(font: .systemFont(ofSize: 14, weight: .light))
    
    let twitterSourceFieldLabel = UILabel(text: "Twitter", font: .systemFont(ofSize: 16))
    let twitterSourceSwitch = UISwitch()
    
    let facebookSourceFieldLabel = UILabel(text: "Facebook", font: .systemFont(ofSize: 16))
    let facebookSourceSwitch = UISwitch()
    
    lazy var sharedStackView: VerticalStackView = {
        let sharedInLabel = UILabel(text: "Shared in:", font: .systemFont(ofSize: 16))
        return VerticalStackView(arrangedSubviews: [
            sharedInLabel,
            UIStackView(arrangedSubviews: [
                twitterSourceFieldLabel, UIView(), twitterSourceSwitch
            ]),
            UIStackView(arrangedSubviews: [
                facebookSourceFieldLabel, UIView(), facebookSourceSwitch
            ])
        ], spacing: 8)
    }()
    
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
    
    // MARK: - API
    
    func update(using filterCriteria: FeedFilterCriteria) {
        
        articleTypeValueLabel.text = filterCriteria.articleType.rawValue
        
        sharedStackView.isHidden = filterCriteria.articleType != .shared
        if !sharedStackView.isHidden {
            let sharingSources = filterCriteria.sharingSources
            if sharingSources.contains(.twitter) {
                twitterSourceSwitch.isOn = true
            }
            if sharingSources.contains(.facebook) {
                facebookSourceSwitch.isOn = true
            }
        }
        
        let timeWindowString: String
        switch filterCriteria.timeWindow.rawValue {
        case 1:
            timeWindowString = "last day"
        case 7:
            timeWindowString = "last week"
        default:
            timeWindowString = "last month"
        }
        timeWindowValueLabel.text = timeWindowString
    }
}
