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
    }
}

// MARK: - Delegates

extension FeedFilterController: FeedFilterViewDelegate {
    
    func didSelectFindArticles() {
        navigator?.navigateToArticlesList(using: filterCriteria)
    }
}
