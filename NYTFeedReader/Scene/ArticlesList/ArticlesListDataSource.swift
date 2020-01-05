//
//  ArticlesListDataSource.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

class ArticlesListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Implementation
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesListCell.description(), for: indexPath) as! ArticlesListCell
        cell.configure()
        return cell
    }
}
