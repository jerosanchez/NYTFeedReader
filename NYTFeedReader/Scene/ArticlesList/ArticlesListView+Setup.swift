//
//  ArticlesListView+Setup.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

extension ArticlesListController {
    
    func setupView() {
        view.backgroundColor = .white
        
        setupListView()
        
        navigationItem.title = "NYT Feed Reader"
    }
    
    private func setupListView() {
        let displayedController = navigationController?.viewControllers.last
        displayedController?.view.addSubviewForAutolayout(tableView)
        tableView.fillSuperview()
    }
}
