//
//  UIApplication+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import UIKit

extension UIApplication {
    var originalKeyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    func clearLaunchScreenCache() {
        do {
            try FileManager.default.removeItem(atPath: NSHomeDirectory() + "/Library/SplashBoard")
        } catch {
            print("Failed to delete launch screen cache: \(error)")
        }
    }
    
    /// 取得影片播放器全螢幕 veiw controller
    func getAVFullScreenViewController() -> UIViewController? {
        var resultVC: UIViewController?
        for window in windows {
            guard let presentedVC = window.rootViewController?.presentedViewController,
                  presentedVC.isKind(of: "AVFullScreenViewController")
            else {
                continue
            }
            resultVC = presentedVC
            break
        }
        return resultVC
    }
    
    /// 取得最上層的影片播放器全螢幕 veiw controller
//    func getTopPlayerViewController() -> UIViewController? {
//        if let fullScreenVC = getAVFullScreenViewController() {
//            return fullScreenVC
//        }
//        guard let topVC = App.topViewController() else {
//            return nil
//        }
//
//        let isPlayer01 = topVC is VideoPlayerViewController
//        let isPlayer02 = topVC is MoviePlayerViewController
//
//        if isPlayer01 || isPlayer02 {
//            return topVC
//        } else {
//            return nil
//        }
//    }
    
    func open(in url: URL?) {
        guard let url = url else {
            print(error: "[URL] 網址解析錯誤 nil")
            return
        }
        if !canOpenURL(url) {
            print(error: "[URL] 無法開啟 \(url.absoluteString)")
            return
        }
        open(url, options: [:], completionHandler: nil)
    }

}
