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
        view.backgroundColor = AppConfig.Color.sceneBackground
        
        setupListView()
        setupSpinnerView()
        
        navigationItem.title = AppConfig.ArticlesList.sceneTitleText
    }
    
    private func setupListView() {
        let displayedController = navigationController?.viewControllers.last
        displayedController?.view.addSubviewForAutolayout(tableView)
        tableView.fillSuperview()
        tableView.isHidden = true // while loading data
    }
    
    private func setupSpinnerView() {
        let spinnerSize = AppConfig.Size.spinner
        let scaleSpinner = CGAffineTransform.init(scaleX: spinnerSize, y: spinnerSize)
        spinnerView.transform = scaleSpinner

        let displayedController = navigationController?.viewControllers.last
        displayedController?.view.addSubviewForAutolayout(spinnerView)
        spinnerView.centerInSuperview()
        spinnerView.color = AppConfig.Color.spinner
        spinnerView.hidesWhenStopped = true
        spinnerView.startAnimating()
    }
}
