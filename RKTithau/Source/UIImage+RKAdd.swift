//
//  UIImage+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIImage {
    /// Picture ratio of width 1
    var ratioByWidth: CGFloat {
        return self.size.height / self.size.width
    }
    
    /// Picture ratio of high 1
    var ratioByHeight: CGFloat {
        return self.size.width / self.size.height
    }
}
