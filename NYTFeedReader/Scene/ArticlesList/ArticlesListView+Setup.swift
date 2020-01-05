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
        setupSpinnerView()
        
        navigationItem.title = "NYT Feed Reader"
    }
    
    private func setupListView() {
        let displayedController = navigationController?.viewControllers.last
        displayedController?.view.addSubviewForAutolayout(tableView)
        tableView.fillSuperview()
        tableView.isHidden = true // while loading data
    }
    
    private func setupSpinnerView() {
        let scaleSpinner = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        spinnerView.transform = scaleSpinner

        let displayedController = navigationController?.viewControllers.last
        displayedController?.view.addSubviewForAutolayout(spinnerView)
        spinnerView.centerInSuperview()
        spinnerView.color = .darkGray
        spinnerView.hidesWhenStopped = true
        spinnerView.startAnimating()
    }
}
