//
//  UILabel+Init.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UILabel {
    /// Initialization contains text color, font size
    convenience init(color: UIColor, font value: CGFloat) {
        self.init(text: nil, color: color, font: value)
    }
    
    /// Initialization contains text color, font size, lines
    convenience init(color: UIColor, font value: CGFloat, lines: Int) {
        self.init(text: nil, color: color, font: value)
        self.numberOfLines = lines
    }
    
    /// Initialization contains text, text color, font size
    convenience init(text: String?, color: UIColor, font value: CGFloat) {
        self.init(text: text, color: color, font: value, align: .left)
    }
    
    /// Initialization contains text color, font size, text align
    convenience init(color: UIColor, font value: CGFloat, align: NSTextAlignment) {
        self.init(text: nil, color: color, font: value, align: align)
    }
    
    /// Initialization contains text, text color, font size, text align
    convenience init(text: String?, color: UIColor, font value: CGFloat, align: NSTextAlignment) {
        self.init()
        self.text = text
        self.textColor = color
        self.font = .systemFont(ofSize: value)
        self.textAlignment = align
    }
    
    /// Initialization contains text color, bold font size
    convenience init(color: UIColor, boldFont value: CGFloat) {
        self.init()
        self.textColor = color
        self.font = .boldSystemFont(ofSize: value)
    }
}
