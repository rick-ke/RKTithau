//
//  RKUtility.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

final class App {
    static func topViewController(controller: UIViewController? = UIApplication.shared.originalKeyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

final class Space {
    /// 裝置螢幕寬
    static let screenWidth = UIScreen.main.bounds.width
    /// 裝置螢幕高
    static let screenHeight = UIScreen.main.bounds.height
    /// 裝置螢幕長寬
    static let screenBounds = UIScreen.main.bounds
    /// 螢幕長寬比3:2
    static let isScreen32 = (Space.screenHeight / Space.screenWidth) == 1.5
    /// 螢幕長寬比16:9
    static let isScreen169 = (Space.screenHeight / Space.screenWidth).floor(toDecimal: 2) == 1.77
    /// iPhoneX系列 Home Indicator 高度
    /// iPhoneX = 34
    /// iPhone = 0
    static var homeIndicatorHeight: CGFloat = {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.originalKeyWindow?.safeAreaInsets.bottom ?? 0
        } else {
            return 0
        }
    }()
    /// iPhone 的 notch 高度
    /// iPhoneX = 44
    /// iPhone = 20
    static var notchHeight: CGFloat = {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.originalKeyWindow?.safeAreaInsets.top ?? 0
        } else {
            return 0
        }
    }()
    /// 狀態欄高度
    /// iPhoneX = 44
    /// iPhone = 20
    static var statusBarHeight: CGFloat = {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.originalKeyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.size.height
        }
    }()
    /// 導覽列高度（不包含狀態欄）
    static var navigationBarHeight: CGFloat = {
        return 44
    }()
    /// 導覽高度（包含狀態欄）
    static var navigationHeight: CGFloat = {
        return navigationBarHeight + statusBarHeight
    }()
    /// 標籤列高度（不包含首頁指標）
    static var tabBarHeight: CGFloat = {
        return 49
    }()
    /// 標籤列高度（包含首頁指標）
    static var tabHeight: CGFloat = {
        return homeIndicatorHeight + tabBarHeight
    }()
    /// 裝置寬度的基準, 以iPhoneX的375為基礎
    static var nativeBase: CGFloat = {
        return UIScreen.main.nativeBounds.width / UIScreen.main.nativeScale / 375
    }()
}

@objc class OCSpace: NSObject {
    @objc static var statusBarFrame: CGRect = {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.originalKeyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
        } else {
            return UIApplication.shared.statusBarFrame
        }
    }()
    /// 狀態欄高度
    /// iPhoneX = 44
    /// iPhone = 20
    @objc static var statusBarHeight: CGFloat = {
        return Space.statusBarHeight
    }()
    /// 標籤列高度（包含首頁指標）
    @objc static var tabHeight: CGFloat = {
        return Space.homeIndicatorHeight + Space.tabBarHeight
    }()
}

public func print(info object: Any?, file: String = #file, line: Int = #line ) {
    let message = object ?? "nil"
#if DEBUG
    print("🟩🟩🟩\((file as NSString).lastPathComponent) line\(line): \(message)")
#endif
}

public func print(info message: String, file: String = #file, line: Int = #line ) {
#if DEBUG
    print("🟩🟩🟩\((file as NSString).lastPathComponent) line\(line): \(message)")
#endif
}

public func print(info dic: [String: Any], file: String = #file, line: Int = #line ) {
    var message = "Dictionary ="
    for (i, (k, v)) in dic.enumerated() {
        message += "\n    \(i) ) \(k): \(v)"
    }
#if DEBUG
    print("🟩🟩🟩\((file as NSString).lastPathComponent) line\(line): \(message)")
#endif
}

public func print(info array: [Any], file: String = #file, line: Int = #line ) {
    var message = "Array ="
    for (i, v) in array.enumerated() {
        message += "\n    \(i) ) \(v)"
    }
#if DEBUG
    print("🟩🟩🟩\((file as NSString).lastPathComponent) line\(line): \(message)")
#endif
}

public func print(warning object: Any?, file: String = #file, line: Int = #line ) {
    let message = object ?? "nil"
#if DEBUG
    print("🟨🟨🟨\((file as NSString).lastPathComponent) line\(line): \(message)")
#endif
}

public func print(error object: Any?, file: String = #file, line: Int = #line ) {
    let message = object ?? "nil"
#if DEBUG
    print("🟥🟥🟥\((file as NSString).lastPathComponent) line\(line): \(message)")
#endif
}

public func print(error: Error?, file: String = #file, line: Int = #line ) {
    let message = error?.localizedDescription ?? "nil"
#if DEBUG
    print("🟥🟥🟥\((file as NSString).lastPathComponent) line\(line): \(message)")
#endif
}

public func pt(_ number: CGFloat) -> CGFloat {
    return Space.nativeBase * number
}

/// 處理回傳閉包事件
typealias Handler = (() -> Void)

/// 指數, 指的是以0為第一個物件
typealias Index = Int

/// 連結, 文字串
typealias Link = String

/// 日期, 文字串
typealias DateString = String

/// Json物件
typealias JsonObject = [String: Any]
