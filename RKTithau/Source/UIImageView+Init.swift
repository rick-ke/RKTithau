//
//  UIImageView+Init.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(contentMode: ContentMode) {
        self.init()
        self.contentMode = contentMode
        self.clipsToBounds = true
    }
}
