//
//  UIView+Layer.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIView {
    func clipsCornerRadius(_ value: CGFloat) {
        layer.cornerRadius = value
        clipsToBounds = true
    }
    
    func drawBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
