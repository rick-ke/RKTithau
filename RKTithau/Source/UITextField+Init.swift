//
//  UITextField+Init.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UITextField {
    /// Initialization contains font size, placeholder
    convenience init(fontSize: CGFloat, placeholder: String?) {
        self.init(text: nil, color: nil, fontSize: fontSize, placeholder: placeholder)
    }
    
    /// Initialization contains text color, font size
    convenience init(color: UIColor?, fontSize: CGFloat) {
        self.init(text: nil, color: color, fontSize: fontSize, placeholder: nil)
    }
    
    /// Initialization contains text color, font size, placeholder
    convenience init(color: UIColor?, fontSize: CGFloat, placeholder: String?) {
        self.init(text: nil, color: color, fontSize: fontSize, placeholder: placeholder)
    }
    
    /// Initialization contains text, text color, font size, placeholder
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat, placeholder: String?) {
        self.init()
        self.text = text
        self.font = .systemFont(ofSize: fontSize)
        self.textColor = color
        self.placeholder = placeholder
    }
    
    func setPlaceholder(_ text: String, color: UIColor?) {
        let attributes = [NSAttributedString.Key.foregroundColor: color ?? .clear]
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
    }
}
