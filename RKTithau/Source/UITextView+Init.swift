//
//  UITextView+Init.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UITextView {
    /// Initialization contains text color, font size
    convenience init(color: UIColor, font value: CGFloat) {
        self.init()
        self.init(text: nil, color: color, font: value)
    }
    
    /// Initialization contains text, text color, font size
    convenience init(text: String?, color: UIColor, font value: CGFloat) {
        self.init()
        self.text = text
        self.font = .systemFont(ofSize: value)
        self.textColor = color
    }
}
