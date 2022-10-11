//
//  UIImage+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIImage {
    /// Picture ratio of width 1
    var ratioByWidth: CGFloat {
        return self.size.height / self.size.width
    }
    
    /// Picture ratio of high 1
    var ratioByHeight: CGFloat {
        return self.size.width / self.size.height
    }
    
    /// Image into base64 string
    var toBase64: String? {
        let imageData = self.pngData()
        let strBase64 = imageData?.base64EncodedString()
        return strBase64
    }
    
    func compressWithMaxKB(_ maxKB:Int) -> Data? {
        
        var compression:CGFloat = 1
        
        guard var data = self.jpegData(compressionQuality: compression) else { return nil }
        
        if (data.count / 1024) <= maxKB {
            return data
        }
        
        var max:CGFloat = 1,min:CGFloat = 0.8//最小0.8
        
        for _ in 0..<6 {//最多压缩6次
            compression = (max+min)/2
            if let tmpdata = self.jpegData(compressionQuality: compression) {
                data = tmpdata
            } else {
                return nil
            }
            
            if (data.count / 1024) <= maxKB {
                return data
            } else {
                max = compression
            }
        }
        //压缩分辨率
        guard var resultImage = UIImage(data: data) else { return nil }
        
        var lastDataCount:Int = 0
        
        while (data.count / 1024) > maxKB && data.count != lastDataCount {
            
            lastDataCount = data.count
            
            let ratio = CGFloat(maxKB)/CGFloat((data.count / 1024))
            
            let size = CGSize(width: resultImage.size.width*sqrt(ratio), height: resultImage.size.height*sqrt(ratio))
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: CGFloat(Int(size.width)), height: CGFloat(Int(size.height))), true, 1)//防止黑边
            
            resultImage.draw(in: CGRect(origin: .zero, size: size))//比转成Int清晰
            
            if let tmp = UIGraphicsGetImageFromCurrentImageContext() {
                
                resultImage = tmp
                UIGraphicsEndImageContext()
            } else {
                
                UIGraphicsEndImageContext()
                return nil
            }
            
            if let tmpdata = resultImage.jpegData(compressionQuality: compression) {
                data = tmpdata
            } else {
                return nil
            }
        }
        return data
    }
    
    func setText(_ text: NSString) -> UIImage {
        //set string style
        let font = UIFont.font(size: 24, weight: .bold)
        let colorDic:  [NSAttributedString.Key : Any] = [NSAttributedString.Key.font:font!, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let textSize = text.size(withAttributes: colorDic)
        //開啟bitmap
        UIGraphicsBeginImageContext(self.size)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let point = CGPoint(x: (self.size.width - textSize.width) / 2.0
                            , y: (self.size.height - textSize.height) / 2.0)
        let rect = CGRect(origin: point
                          , size: textSize)
        
        text.draw(in: rect, withAttributes: colorDic)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
    
    /// 畫矩形
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
    
    /// 畫圓形
    convenience init?(color: UIColor, diameter: CGFloat) {
        let size = CGSize(width: diameter, height: diameter)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return nil
        }
        ctx.saveGState()
        
        let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        ctx.setFillColor(color.cgColor)
        ctx.fillEllipse(in: rect)
        
        ctx.restoreGState()
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = img?.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
    
    /// 畫圓形
    convenience init?(color: UIColor, circleSize size: CGSize) {
        // 創立size根據大小，透明度，縮放比的一個bitmap
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        // 拿到當前要寫入的bitmap
        let context = UIGraphicsGetCurrentContext()
        // 寫入內部和框的顏色
        context?.setFillColor(color.cgColor)
        context?.setStrokeColor(UIColor.clear.cgColor)
        let bounds = CGRect(origin: .zero, size: size)
        // 跟據bounds畫出圖型
        context?.addEllipse(in: bounds)
        context?.drawPath(using: .fill)
        // 從bitmap轉化成image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 釋放bitmap 避免leak
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
    
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
    
    convenience init(drawView: UIView) {
        UIGraphicsBeginImageContextWithOptions(drawView.bounds.size, drawView.isOpaque, 0.0)
        drawView.drawHierarchy(in: drawView.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
    
    convenience init(contentView: UIView) {
        let renderer = UIGraphicsImageRenderer(size: contentView.bounds.size)
        let image = renderer.image(actions: { (context) in
            contentView.drawHierarchy(in: contentView.bounds, afterScreenUpdates: true)
        })
        self.init(cgImage: image.cgImage!)
    }
}
