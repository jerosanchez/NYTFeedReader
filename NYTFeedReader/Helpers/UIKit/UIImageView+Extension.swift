//
//  UIImageView+Extension.swift
//  NYTFeedReader
//
//  Created by Jero Sánchez on 05/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(cornerRadius: CGFloat = 0, width: CGFloat? = nil, height: CGFloat? = nil, bkColor: UIColor? = nil) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.backgroundColor = .lightGray
        
        if let width = width {
            constrainWidth(constant: width)
        }
        
        if let height = height {
            constrainHeight(constant: height)
        }
        
        if let bkColor = bkColor {
            backgroundColor = bkColor
        }
    }
}
