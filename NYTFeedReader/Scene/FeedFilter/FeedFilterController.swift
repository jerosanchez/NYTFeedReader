//
//  FeedFilterController.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

protocol FeedFilterNavigationLogic {
    func navigateToArticlesList(using filterCriteria: FeedFilterCriteria)
}

class FeedFilterController: UIViewController {

    // MARK: - Properties
    
    var navigator: FeedFilterNavigationLogic?
    
    private var filterCriteria: FeedFilterCriteria

    private let sceneView = FeedFilterView()
    
    // MARK: - Initialization
    
    init(defaultFilterCriteria: FeedFilterCriteria) {
        self.filterCriteria = defaultFilterCriteria
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = sceneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Filter"
        
        sceneView.delegate = self
        sceneView.update(using: filterCriteria)
    }
}

// MARK: - Delegates

extension FeedFilterController: FeedFilterViewDelegate {
    
    func didSelectChangeArticleType() {
        let alertView = UIAlertController(title: "Select article type:", message: "", preferredStyle: .actionSheet)
        
        let options = ArticleType.allCases.enumerated().map { "\($0.element.rawValue)" }
        let pickerView = ValuePickerView(options: options)
        pickerView.handleSelection = { [weak self] articleTypeValue in
            alertView.dismiss(animated: true) {
                let newArticleType = ArticleType(rawValue: articleTypeValue)
                self?.updateSceneViewWith(articleType: newArticleType)
            }
        }
        
        alertView.view.addSubviewForAutolayout(pickerView)
        pickerView.fillSuperview()
        
        present(alertView, animated: true, completion: nil)
    }
    
    func didSelectChangeTimeWindow() {
        let alertView = UIAlertController(title: "Select time window:", message: "", preferredStyle: .actionSheet)
        
        let options = TimeWindow.allCases.enumerated().map { "\($0.element.rawValue)" }
        let pickerView = ValuePickerView(options: options)
        pickerView.handleSelection = { [weak self] timeWindowValue in
            alertView.dismiss(animated: true) {
                let newTimeWindow = TimeWindow(rawValue: Int(timeWindowValue)!)
                self?.updateSceneViewWith(timeWindow: newTimeWindow)
            }
        }
        
        alertView.view.addSubviewForAutolayout(pickerView)
        pickerView.fillSuperview()
        
        present(alertView, animated: true, completion: nil)
    }
    
    func didSelectTwitterSwitch(isOn: Bool) {
        var newSharingSources = filterCriteria.sharingSources
        if isOn {
            newSharingSources.append(.twitter)
        } else {
            newSharingSources.removeAll(where: { $0 == .twitter })
        }
        updateSceneViewWith(sharingSources: newSharingSources)
    }
    
    func didSelectFacebookSwitch(isOn: Bool) {
        var newSharingSources = filterCriteria.sharingSources
        if isOn {
            newSharingSources.append(.facebook)
        } else {
            newSharingSources.removeAll(where: { $0 == .facebook })
        }
        updateSceneViewWith(sharingSources: newSharingSources)
    }
    
    func didSelectFindArticles() {
        navigator?.navigateToArticlesList(using: filterCriteria)
    }
    
    // MARK: - Delegate helpers
    
    private func updateSceneViewWith(articleType: ArticleType? = nil, sharingSources: [SharingSource]? = nil, timeWindow: TimeWindow? = nil) {
        
        let newArticleType = articleType ?? filterCriteria.articleType
        let newSharingSources = sharingSources ?? filterCriteria.sharingSources
        let newtimeWindow = timeWindow ?? filterCriteria.timeWindow
        
        filterCriteria = FeedFilterCriteria(
            articleType: newArticleType,
            sharingSources: newSharingSources,
            timeWindow: newtimeWindow)
        
        sceneView.update(using: filterCriteria)
    }
}
