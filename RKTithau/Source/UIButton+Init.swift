//
//  UIButton+Init.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIButton {
    /// Initialization contains text
    convenience init(text: String?) {
        self.init()
        self.setTitle(text, for: .normal)
    }

    /// Initialization contains text color, font size
    convenience init(color: UIColor, font value: CGFloat) {
        self.init(text: nil, color: color, font: value, bgColor: .clear)
    }
    
    /// Initialization contains text, text color, font size
    convenience init(text: String?, color: UIColor, font value: CGFloat) {
        self.init(text: text, color: color, font: value, bgColor: .clear)
    }
    
    /// Initialization contains text, text color, font size, background color
    convenience init(text: String?, color: UIColor, font value: CGFloat, bgColor: UIColor) {
        self.init()
        self.setTitle(text, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: value)
        self.backgroundColor = bgColor
    }
}
