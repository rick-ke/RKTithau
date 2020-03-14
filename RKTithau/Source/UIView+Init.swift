//
//  UIView+Init.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIView {
    convenience init(color: UIColor) {
        self.init()
        self.backgroundColor = color
    }
    
    convenience init(size: CGSize) {
        self.init()
        self.frame.size = size
    }
}
