//
//  ArticlesListDataSource.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

class ArticlesListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    var feedArticles = [FeedArticle]()
    
    // MARK: - Implementation
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesListCell.description(), for: indexPath) as! ArticlesListCell
        let feedArticle = feedArticles[indexPath.row]
        cell.configure(withFeedArticle: feedArticle)
        return cell
    }
}
