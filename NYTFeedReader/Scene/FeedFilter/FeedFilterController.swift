//
//  FeedFilterController.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

class FeedFilterController: UIViewController {

    // MARK: - Properties
    
    private let sceneView = FeedFilterView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = sceneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "NYT Feed Reader"
        
        sceneView.delegate = self
    }
}

// MARK: - Delegates

extension FeedFilterController: FeedFilterViewDelegate {
    
    func didSelectFindArticles() {
        print("Tapped <Find article> button")
    }
}
