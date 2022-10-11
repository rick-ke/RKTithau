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
    convenience init(color: UIColor?, fontSize: CGFloat) {
        self.init(text: nil, color: color, fontSize: fontSize)
    }
    
    /// Initialization contains text, text color, font size
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat) {
        self.init()
        self.text = text
        self.font = .systemFont(ofSize: fontSize)
        self.textColor = color
    }
}

extension UITextView {
    /// Wrap to the content (Text / Attributed Text).
    func wrapToContent() {
        contentInset = .zero
        scrollIndicatorInsets = .zero
        contentOffset = .zero
        textContainerInset = .zero
        textContainer.lineFragmentPadding = 0
        sizeToFit()
    }
    
    /// update content view heigth according to its content text, dynamic
    func fitContentHeightWithText() {
        translatesAutoresizingMaskIntoConstraints = true
        sizeToFit()
        isScrollEnabled = false
    }
    
    func getTextSize() -> CGSize {
        guard let text = text,
              let font = font
        else {
            return .zero
        }
        let attributes = [NSAttributedString.Key.font: font]
        let textSize = (text as NSString)
            .boundingRect(with: frame.size,
                          options: [.usesLineFragmentOrigin, .usesFontLeading],
                          attributes: attributes,
                          context: nil)
            .size
        return textSize
    }
}
