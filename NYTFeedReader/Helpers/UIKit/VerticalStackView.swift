//
//  VerticalStackView.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

final class VerticalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach {
            addArrangedSubview($0)
        }
        
        self.axis = .vertical
        self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
