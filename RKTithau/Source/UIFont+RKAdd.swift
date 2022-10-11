//
//  UIFont+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import UIKit

/// 字體寬度Enum
enum FontWeightType {
    case thin
    case regular
    case medium
    case semibold
    case bold
    case heavy
    case black
    case light
    case ultraLight

    @available(iOS 8.2, *)
    func systemWeight() -> UIFont.Weight {
        switch self {
        case .thin:
            return UIFont.Weight.thin
        case .regular:
            return UIFont.Weight.regular
        case .medium:
            return UIFont.Weight.medium
        case .semibold:
            return UIFont.Weight.semibold
        case .bold:
            return UIFont.Weight.bold
        case .heavy:
            return UIFont.Weight.heavy
        case .black:
            return UIFont.Weight.black
        case .light:
            return UIFont.Weight.light
        case .ultraLight:
            return UIFont.Weight.ultraLight
        }
    }
}

// UIFont + Extension
extension UIFont {
     
    /// 系統字體，默認16大小，Weight为regular
    class func font(size: CGFloat = 16, weight: FontWeightType = .regular) -> UIFont! {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: weight.systemWeight())
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    static func PingFangSCLight(size: CGFloat = 16) -> UIFont {
        return UIFont(name: "PingFangSC-Light", size: size)!
    }
    
    static func PingFangSCRegular(size: CGFloat = 16) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: size)!
    }
    
    static func PingFangSCMedium(size: CGFloat = 16) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: size)!
    }
    
    static func PingFangSCBold(size: CGFloat = 16) -> UIFont {
        return UIFont(name: "PingFangSC-bold", size: size)!
    }
}
