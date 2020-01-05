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
    
    // MARK: - Initialization
    
    init() {
        self.tableView = UITableView()
        self.dataSource = ArticlesListDataSource()
        
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
    }
    
    // MARK: - Helpers
    
    private func registerCells() {
        tableView.register(ArticlesListCell.self, forCellReuseIdentifier: ArticlesListCell.description())
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
