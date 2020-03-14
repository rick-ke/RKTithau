//
//  RKUtility.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

final class App {
    static var topController: UIViewController? {
        guard var topController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        return topController
    }
    static var boundleId: String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    static var displayName: String {
        return (Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String) ?? ""
    }
    static var version: String {
        return (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String) ?? "0.0.0"
    }
    static var buildVersion: String {
        return (Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String) ?? "0"
    }
}

final class Space {
    /// 裝置螢幕寬
    static let screenWidth = UIScreen.main.bounds.width
    /// 裝置螢幕高
    static let screenHeight = UIScreen.main.bounds.height
    /// 螢幕長寬比3:2
    static let isScreen32 = (Space.screenHeight / Space.screenWidth) == 1.5
    /// 螢幕長寬比16:9
    static let isScreen169 = (Space.screenHeight / Space.screenWidth).floor(toDecimal: 2) == 1.77
    /// iPhoneX系列 Home Indicator 高度
    static var homeIndicatorHeight: CGFloat {
        if #available(iOS 11.0, *) {
            return App.window?.safeAreaInsets.bottom ?? 0
        } else {
            return 0
        }
    }
    /// iPhone 的 notch 高度
    static var notchHeight: CGFloat {
        if #available(iOS 11.0, *) {
            return App.window?.safeAreaInsets.top ?? 0
        } else {
            return 0
        }
    }
    /// Is this device has notch or not
    static var hasNotch: Bool {
        return notchHeight != 0
    }
    /// 狀態欄高度
    static var statusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return App.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.size.height
        }
    }
    /// 導覽列高度（不包含狀態欄）
    static var navigationBarHeight: CGFloat {
        return 44
    }
    /// 導覽高度（包含狀態欄）
    static var navigationHeight: CGFloat {
        return statusBarHeight + navigationBarHeight
    }
}

public func print(msg message: Any?, file: String = #file, line: Int = #line ) {
    #if DEBUG
    if let message = message {
        print("\((file as NSString).lastPathComponent) line\(line): \(message)")
    } else {
        print("\((file as NSString).lastPathComponent) line\(line): nil)")
    }
    #endif
}

public func printError(msg message: Any?, file: String = #file, line: Int = #line ) {
    #if DEBUG
    if let message = message {
        print("😡😡😡😡😡😡 \((file as NSString).lastPathComponent) line\(line): \(message)")
    } else {
        print("😡😡😡😡😡😡 \((file as NSString).lastPathComponent) line\(line): nil)")
    }
    #endif
}


public func pt(_ number: CGFloat) -> CGFloat {
    let screenWidth = UIScreen.main.bounds.width
    return screenWidth / 375 * number  // 375為iPhoneX為基礎
}

/// 處理回傳閉包事件
typealias Handler = (() -> Void)

/// 指數, 指的是以0為第一個物件
typealias Index = Int
