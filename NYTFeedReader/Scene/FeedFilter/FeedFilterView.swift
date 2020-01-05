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
    
    let instructionsLabel = UILabel(text: AppConfig.FeedFilter.helpText, font: AppConfig.Font.formHelpLabel)
    
    let articleTypeFieldLabel = UILabel(text: AppConfig.FeedFilter.articleTypeLabelText, font: AppConfig.Font.formFieldLabel)
    let articleTypeValueLabel = UILabel(font: AppConfig.Font.formFieldValue)
    
    let timeWindowFieldLabel = UILabel(text: AppConfig.FeedFilter.timeWindowLabelText, font: AppConfig.Font.formFieldLabel)
    let timeWindowValueLabel = UILabel(font: AppConfig.Font.formFieldValue)
    
    let twitterSourceFieldLabel = UILabel(text: AppConfig.FeedFilter.twitterLabelText, font: AppConfig.Font.formFieldLabel)
    let twitterSourceSwitch = UISwitch()
    
    let facebookSourceFieldLabel = UILabel(text: AppConfig.FeedFilter.facebookLabelText, font: AppConfig.Font.formFieldLabel)
    let facebookSourceSwitch = UISwitch()
    
    lazy var sharedStackView: VerticalStackView = {
        let sharedInLabel = UILabel(text: AppConfig.FeedFilter.sharedInLabelText, font: AppConfig.Font.formFieldLabel)
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
        button.setTitle(AppConfig.FeedFilter.findArticlesButtonTitle, for: .normal)
        button.backgroundColor = AppConfig.Color.formButtonBackground
        button.titleLabel?.font = AppConfig.Font.formButtonTitle
        button.setTitleColor(AppConfig.Color.formButtonForeground, for: .normal)
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
            timeWindowString = AppConfig.FeedFilter.timeWindow1
        case 7:
            timeWindowString = AppConfig.FeedFilter.timeWindow7
        default:
            timeWindowString = AppConfig.FeedFilter.timeWindow30
        }
        timeWindowValueLabel.text = timeWindowString
    }
}
