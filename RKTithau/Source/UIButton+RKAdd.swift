//
//  UIButton+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

protocol RKImageAssets {
    var name: String { get }
}

extension UIButton {
    /// 初始化帶文本
    convenience init(text: String?) {
        self.init()
        self.setTitle(text, for: .normal)
    }

    /// 初始化帶文字顏色、文字大小
    convenience init(color: UIColor, font value: CGFloat) {
        self.init(text: nil, color: color, font: value, bgColor: .clear)
    }
    
    /// 初始化帶文本、文字顏色、文字大小
    convenience init(text: String?, color: UIColor, font value: CGFloat) {
        self.init(text: text, color: color, font: value, bgColor: .clear)
    }
    
    /// 初始化帶文本、文字顏色、文字大小、背景顏色
    convenience init(text: String?, color: UIColor, font value: CGFloat, bgColor: UIColor) {
        self.init()
        self.setTitle(text, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: value)
        self.backgroundColor = bgColor
    }
    
    /// 初始化帶圖片
    convenience init(image: RKImageAssets) {
        self.init()
        self.setImage(UIImage(named: image.name), for: .normal)
    }

    /// 初始化帶圖片、尺寸
    convenience init(image: RKImageAssets, size: CGSize) {
        self.init()
        self.setImage(UIImage(named: image.name), for: .normal)
        self.frame.size = size
    }
}

/** example:
enum ImageAssets: RKImageAssets {
    case launch32, launch169
    var name: String {
        switch self {
        case .launch32:
            return "launch_image_32"
        case .launch169:
            return "launch_image_169"
        }
    }
}
*/
