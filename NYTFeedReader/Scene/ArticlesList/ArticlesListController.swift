//
//  ArticlesListController.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

protocol ArticlesListNavigationLogic {
    func navigateToArticleDetail()
}

class ArticlesListController: UIViewController {
    
    // MARK: - Properties
    
    var navigator: ArticlesListNavigationLogic?
    
    private(set) var tableView: UITableView
    private let dataSource: ArticlesListDataSource
    private let viewModel: ArticlesListViewModel
    
    // MARK: - Initialization
    
    init(dataSource: ArticlesListDataSource, viewModel: ArticlesListViewModel) {
        self.tableView = UITableView()
        self.dataSource = dataSource
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        self.tableView.dataSource = dataSource
        self.tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Articles"
        
        registerCells()
        setupView()
        bindAndFire()
    }
    
    // MARK: - Helpers
    
    private func registerCells() {
        tableView.register(ArticlesListCell.self, forCellReuseIdentifier: ArticlesListCell.description())
    }
    
    private func bindAndFire() {
        viewModel.feedArticles.bind { feedArticles in
            self.dataSource.feedArticles = feedArticles
            self.tableView.reloadData()
        }
        viewModel.loadingError.bind { error in
            // Should not be executed with an error nil,
            // but I prefer not to use the bang operator just in case
            print("Loading error: \(error?.localizedDescription ?? "Something weird happened... :-(")")
        }
        
        viewModel.loadArticles()
    }
}

// MARK: - Delegates

extension ArticlesListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigator?.navigateToArticleDetail()
    }
}
