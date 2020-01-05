//
//  NYTFeedRemoteRepository.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

class NYTFeedRemoteRepository: NYTFeedRepository {
    
    // MARK: - Properties
    
    private let networkingService: NetworkingService
    
    // MARK: - Initialization
    
    init(networkingService: NetworkingService) {
        self.networkingService = networkingService
    }
    
    // MARK: - Implementation
    
    func fetchArticles(articleType: ArticleType, timeWindow: TimeWindow, sharingSources: [SharingSource], completion: @escaping (Result<[FeedArticle], Error>) -> ()) {
        
        let apiPath = "\(articleType)/\(timeWindow.rawValue)"
        var socialNetwork: String
        if articleType == .shared,
            sharingSources.count == 1 {
            socialNetwork = "/\(sharingSources.first!.rawValue)"
        } else {
            // TODO: avoid duplication of sharing sources
            socialNetwork = ""
        }
        let baseURL = "https://api.nytimes.com/svc/mostpopular/v2/"
        let urlString = baseURL + apiPath + socialNetwork + ".json" + apiKeyParam
        
        print("Fetching: \(urlString)")
        
        networkingService.fetch(urlString: urlString) { (result: Result<ResponseModel, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Helpers
    
    let apiKeyParam = "?api-key=\(AppConfig.Secrets.NYTApiKey)"
    
    private struct ResponseModel: Decodable {
        let results: [FeedArticle]
    }
}
