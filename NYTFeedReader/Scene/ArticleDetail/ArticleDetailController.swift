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
    
    private let webView = WKWebView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dummyUrlString = "https://apple.com"
        let dummyUrl = URL(string: dummyUrlString)!
        webView.load(URLRequest(url: dummyUrl))
        webView.allowsBackForwardNavigationGestures = false
        
        navigationItem.title = "Article title"
    }
}
