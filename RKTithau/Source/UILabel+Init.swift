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
    convenience init(color: UIColor?, fontSize: CGFloat) {
        self.init(text: nil, color: color, fontSize: fontSize)
    }
    
    /// Initialization contains text color, font size, lines
    convenience init(color: UIColor?, fontSize: CGFloat, lines: Int) {
        self.init(text: nil, color: color, fontSize: fontSize, align: .natural, lines: lines)
    }
    
    /// Initialization contains text color, font size, font weight
    convenience init(color: UIColor?, fontSize: CGFloat, weight: UIFont.Weight) {
        self.init(text: nil, color: color, fontSize: fontSize, weight: weight, align: .natural, lines: 1)
    }
    
    /// Initialization contains text color, font size, font weight, text align
    convenience init(color: UIColor?, fontSize: CGFloat, weight: UIFont.Weight, align: NSTextAlignment) {
        self.init(text: nil, color: color, fontSize: fontSize, weight: weight, align: align, lines: 1)
    }
    
    /// Initialization contains text color, font size, font weight, text align, lines
    convenience init(color: UIColor?, fontSize: CGFloat, weight: UIFont.Weight, align: NSTextAlignment, lines: Int) {
        self.init(text: nil, color: color, fontSize: fontSize, weight: weight, align: align, lines: lines)
    }
    
    /// Initialization contains text color, font size, text align, lines
    convenience init(color: UIColor?, fontSize: CGFloat, align: NSTextAlignment, lines: Int) {
        self.init(text: nil, color: color, fontSize: fontSize, weight: .regular, align: align, lines: lines)
    }
    
    /// Initialization contains text, text color, font size
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat) {
        self.init(text: text, color: color, fontSize: fontSize, align: .natural)
    }
    
    /// Initialization contains text, text color, font size, font weight
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat, weight: UIFont.Weight) {
        self.init(text: text, color: color, fontSize: fontSize, weight: weight, align: .natural, lines: 1)
    }
    
    /// Initialization contains text color, font size, text align
    convenience init(color: UIColor?, fontSize: CGFloat, align: NSTextAlignment) {
        self.init(text: nil, color: color, fontSize: fontSize, align: align)
    }
    
    /// Initialization contains text, text color, font size, text align
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat, align: NSTextAlignment) {
        self.init(text: text, color: color, fontSize: fontSize, align: align, lines: 1)
    }
    
    /// Initialization contains text, text color, font size, text align, lines
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat, align: NSTextAlignment, lines: Int) {
        self.init(text: text, color: color, fontSize: fontSize, weight: .regular, align: align, lines: lines)
    }
    
    /// Initialization contains text, text color, font size, font weight, text align, lines
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat, weight: UIFont.Weight, align: NSTextAlignment, lines: Int) {
        self.init()
        self.text = text
        self.textColor = color
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.textAlignment = align
        self.numberOfLines = lines
    }
    
    /// Initialization contains text align
    convenience init(align: NSTextAlignment) {
        self.init()
        self.textAlignment = align
    }
}

extension UILabel {
    var isTruncated: Bool {
        guard let text = text,
              let font = font
        else {
            return false
        }
        let labelSize = CGSize(width: frame.size.width, height: .greatestFiniteMagnitude)
        let attributes = [NSAttributedString.Key.font: font]
        let textSize = (text as NSString)
            .boundingRect(with: labelSize,
                          options: .usesLineFragmentOrigin,
                          attributes: attributes,
                          context: nil)
            .size
        return textSize.height > bounds.size.height
    }
    
    func setPincer(prefix: String? = nil, text title: String, trailing: String, suffix: String) {
        text = nil
        resetPincer(prefix: prefix, text: title, trailing: trailing, suffix: suffix)
    }
    
    func resetPincer(prefix: String? = nil, text title: String, trailing: String, suffix: String) {
        if text == nil {
            if let prefix = prefix {
                text = prefix + title + suffix
            } else {
                text = title + suffix
            }
        } else {
            if let prefix = prefix {
                text = prefix + title + trailing + suffix
            } else {
                text = title + trailing + suffix
            }
        }
        layoutIfNeeded()
        while isTruncated {
            let newTitle = String(title.dropLast())
            resetPincer(prefix: prefix, text: newTitle, trailing: trailing, suffix: suffix)
        }
    }
    
    func getTextWidth() -> CGFloat {
        return getTextSize().width
    }
    
    func getTextHeight() -> CGFloat {
        return getTextSize().height
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
                          options: .usesLineFragmentOrigin,
                          attributes: attributes,
                          context: nil)
            .size
        return textSize
    }
    
    func getMaxLines() -> Int {
        guard let text = text,
              let font = font
        else {
            return 0
        }
        
        let maxSize = CGSize(width: frame.size.width, height: .greatestFiniteMagnitude)
        
        let charSize = font.lineHeight
        
        let attributes = [NSAttributedString.Key.font: font]
        let textSize = (text as NSString)
            .boundingRect(with: maxSize,
                          options: .usesLineFragmentOrigin,
                          attributes: attributes,
                          context: nil)
        
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        
        return linesRoundedUp
    }
}

extension UILabel {
    /// 長按複製文字
    public func addLongPressGestureOnCopyText() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(onLongPressGesture))
        self.addGestureRecognizer(longPress)
        self.isUserInteractionEnabled = true
    }
    
    @objc private func onLongPressGesture(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            if let text = self.text {
                print(info: "複製文字成功: \(text)")
                UIPasteboard.general.string = text
            } else {
                print(info: "複製文字失敗")
            }
        }
    }
}

extension UILabel {
    /// 改變字間距
    func changeWordSpace(_ space: CGFloat) {
        guard let text = self.text else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: space])
        self.attributedText = attributedString
        self.sizeToFit()
    }
}
