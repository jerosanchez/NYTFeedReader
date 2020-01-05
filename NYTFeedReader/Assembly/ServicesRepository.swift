//
//  ServicesRepository.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

extension DependencyContainer {
    
    static var networkingService: NetworkingService {
        return NativeNetworkingService()
    }
}
