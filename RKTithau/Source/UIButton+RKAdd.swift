//
//  UIButton+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIButton {
    /// Initialization contains image named
    convenience init(imageNamed: String) {
        self.init()
        self.setImage(UIImage(named: imageNamed), for: .normal)
    }

    /// Initialization contains text
    convenience init(text: String?) {
        self.init()
        self.setTitle(text, for: .normal)
    }
    
    /// Initialization contains background color, corner radius
    convenience init(bgColor: UIColor?, corner: CGFloat) {
        self.init()
        self.backgroundColor = bgColor
        self.setCornerRadius(corner)
    }

    /// Initialization contains text color, font size
    convenience init(color: UIColor?, fontSize: CGFloat) {
        self.init(text: nil, color: color, fontSize: fontSize, weight: .regular, bgColor: nil, corner: 0)
    }
    
    /// Initialization contains text color, font size, weight
    convenience init(color: UIColor?, fontSize: CGFloat, weight: UIFont.Weight) {
        self.init(text: nil, color: color, fontSize: fontSize, weight: .regular, bgColor: nil, corner: 0)
    }
    
    /// Initialization contains text color, font size, background color, corner radius
    convenience init(color: UIColor?, fontSize: CGFloat, bgColor: UIColor?, corner: CGFloat) {
        self.init(text: nil, color: color, fontSize: fontSize, weight: .regular, bgColor: bgColor, corner: corner)
    }
    
    /// Initialization contains text, text color, font size
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat) {
        self.init(text: text, color: color, fontSize: fontSize, weight: .regular, bgColor: nil, corner: 0)
    }
    
    /// Initialization contains text, text color, font size, weight
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat, weight: UIFont.Weight) {
        self.init(text: text, color: color, fontSize: fontSize, weight: weight, bgColor: nil, corner: 0)
    }
    
    /// Initialization contains text, text color, font size, background color
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat, bgColor: UIColor?) {
        self.init(text: text, color: color, fontSize: fontSize, weight: .regular, bgColor: bgColor, corner: 0)
    }
    
    /// Initialization contains text, text color, font size, background color, corner radius
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat, bgColor: UIColor?, corner: CGFloat) {
        self.init(text: text, color: color, fontSize: fontSize, weight: .regular, bgColor: bgColor, corner: corner)
    }
    
    /// Initialization contains text, text color, font size, weight, background color, corner radius
    convenience init(text: String?, color: UIColor?, fontSize: CGFloat, weight: UIFont.Weight, bgColor: UIColor?, corner: CGFloat) {
        self.init()
        self.setTitle(text, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: fontSize, weight: weight)
        self.backgroundColor = bgColor
        self.setCornerRadius(corner)
    }
}

extension UIButton {
    /// 初始化帶圖片
    convenience init(image: UIImage?) {
        self.init()
        self.setImage(image, for: .normal)
    }

    func setTitle(_ title: String?) {
        setTitle(title, for: .normal)
    }
    
    func setTitleColor(_ color: UIColor) {
        setTitleColor(color, for: .normal)
    }
}

extension UIButton {
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden || !self.isUserInteractionEnabled || self.alpha < 0.01 {
            return nil
        }
        // 增加點擊區域 最大為44*44
        let buttonSize = self.bounds.size
        // 若原點擊區小於44x44，則放大點擊區，否则保持原大小不變
        let widthToAdd = max(44 - buttonSize.width, 0)
        let heightToAdd = max(44 - buttonSize.height, 0)
        let largerFrame = self.bounds.insetBy(dx: -widthToAdd / 2, dy: -heightToAdd / 2)

        // 偵測回傳較大的範圍
        return (largerFrame.contains(point)) ? self : nil
    }
}
