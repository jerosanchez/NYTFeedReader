//
//  FeedFilterController.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

protocol FeedFilterNavigationLogic {
    func navigateToArticlesList()
}

class FeedFilterController: UIViewController {

    // MARK: - Properties
    
    var navigator: FeedFilterNavigationLogic?
    
    private let sceneView = FeedFilterView()
    
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
        navigator?.navigateToArticlesList()
    }
}
