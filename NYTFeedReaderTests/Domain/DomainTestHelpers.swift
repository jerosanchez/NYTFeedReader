//
//  DomainTestHelpers.swift
//  NYTFeedReaderTests
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation
@testable import NYTFeedReader

func makeRandomMediaMetadata() -> [MediaMetadata] {
    var metadata = [MediaMetadata]()
    for _ in 1...Int.random(in: 1...10) {
        metadata.append(MediaMetadata(urlString: UUID().description))
    }
    return metadata
}
