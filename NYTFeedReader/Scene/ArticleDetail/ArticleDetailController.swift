//
//  ArticleDetailController.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import WebKit

protocol ArticleDetailNavigationLogic { }

class ArticleDetailController: UIViewController {
    
    // MARK: - Properties
    
    var navigator: ArticleDetailNavigationLogic?
    
    var feedArticle: FeedArticle?
    
    private let webView = WKWebView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: feedArticle?.articleURL ?? "") else {
            // TODO: display alert
            return
        }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = false
        
        navigationItem.title = feedArticle?.title ?? AppConfig.ArticleDetail.defaultSceneTitleText
    }
}
