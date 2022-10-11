//
//  UIColor+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(white: Int) {
        self.init(white: white, alpha: 1)
    }
    
    convenience init(white: Int, alpha: CGFloat) {
        self.init(white: CGFloat(white) / 255.0, alpha: alpha)
    }
    
    convenience init(hex: Int) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF)
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF, alpha: alpha)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha >= 0 && alpha <= 1, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    convenience init?(hex: String, alpha: CGFloat = 1.0) {

        // 0xff0000
        // 1.判断字符串的长度是否符合
        guard hex.count >= 6 else {
            return nil
        }

        // 2.將字轉轉成大寫
        var tempHex = hex.uppercased()

        // 3.判斷開頭: 0x/#/##
        if tempHex.hasPrefix("0x") || tempHex.hasPrefix("##") {
            tempHex = (tempHex as NSString).substring(from: 2)
        }
        if tempHex.hasPrefix("#") {
            tempHex = (tempHex as NSString).substring(from: 1)
        }

        // 4.分别取出RGB
        // FF --> 255
        var range = NSRange(location: 0, length: 2)
        let rHex = (tempHex as NSString).substring(with: range)
        range.location = 2
        let gHex = (tempHex as NSString).substring(with: range)
        range.location = 4
        let bHex = (tempHex as NSString).substring(with: range)

        // 5.掃瞄並將16進制文字轉成10進制數字
        var r: UInt64 = 0, g: UInt64 = 0, b: UInt64 = 0
        Scanner(string: rHex).scanHexInt64(&r)
        Scanner(string: gHex).scanHexInt64(&g)
        Scanner(string: bHex).scanHexInt64(&b)

        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b), alpha: alpha)
    }
    
    
    func asxptImage(_ height: CGFloat = 1) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: height))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: height))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
    
    func getRGBValue() -> (CGFloat , CGFloat , CGFloat){
        guard let components = self.cgColor.components else {
            fatalError("获取颜色的RGB值失败")
        }
        return (components[0] * 255,components[1] * 255,components[2] * 255)
    }
}
    
extension UIColor {
    func rgb() -> Int? {
        var fRed  : CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed   = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue  = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)

            //  (Bits 24-31 are alpha, 16-23 are red, 8-15 are green, 0-7 are blue).
            let rgb = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
            return rgb
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
    
    /// 互補色的RGBA
    func complementaryRGBA() -> (red: Int, green: Int, blue: Int, alpha: CGFloat)? {
        var fRed  : CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed   = Int((1 - fRed) * 255.0)
            let iGreen = Int((1 - fGreen) * 255.0)
            let iBlue  = Int((1 - fBlue) * 255.0)
            let iAlpha = fAlpha
            return (iRed, iGreen, iBlue, iAlpha)
        } else {
            return nil
        }
    }

    /// 互補色
    func complementaryColor() -> UIColor {
        if let compRGBA = complementaryRGBA() {
            return UIColor(red: compRGBA.red, green: compRGBA.green, blue: compRGBA.blue, alpha: compRGBA.alpha)
        } else {
            return .clear
        }
    }
}

extension UIColor {
    static func printComplementaryColor(hex: Int) {
        let rawR = (hex >> 16) & 0xFF
        let rawG = (hex >> 8) & 0xFF
        let rawB = hex & 0xFF
        
        let rawRStr = String(format: "%03d", rawR)
        let rawGStr = String(format: "%03d", rawG)
        let rawBStr = String(format: "%03d", rawB)
        
        let rawHexRStr = String(format: "%02X", rawR)
        let rawHexGStr = String(format: "%02X", rawG)
        let rawHexBStr = String(format: "%02X", rawB)
        
        let comR = 255 - rawR
        let comG = 255 - rawG
        let comB = 255 - rawB
        
        let comRStr = String(format: "%03d", comR)
        let comGStr = String(format: "%03d", comG)
        let comBStr = String(format: "%03d", comB)
        
        let comHexRStr = String(format: "%02X", comR)
        let comHexGStr = String(format: "%02X", comG)
        let comHexBStr = String(format: "%02X", comB)
        
        print(info: "原色碼: \(rawHexRStr)\(rawHexGStr)\(rawHexBStr) 互補色碼: \(comHexRStr)\(comHexGStr)\(comHexBStr) 原RGB: \(rawRStr),\(rawGStr),\(rawBStr) 互補RGB: \(comRStr),\(comGStr),\(comBStr)")
    }
}
