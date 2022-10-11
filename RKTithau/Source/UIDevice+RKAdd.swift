//
//  UIDevice+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import UIKit

extension UIDevice {
    /// 系統螢幕外觀顏色
    var interfaceStyle: UIUserInterfaceStyle {
        return UIViewController().traitCollection.userInterfaceStyle
    }

    /// iOS 7 以上的版本只會回傳 02:00:00:00:00:00
    var macAddress: String {
        return "02:00:00:00:00:00"
    }
    
    /// IP位置(內網)
    var ipAddress: String? {
        var addresses: [String] = []

        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        
        guard getifaddrs(&ifaddr) == 0 else {
            return nil
        }
        
        var ptr = ifaddr
        while (ptr != nil) {
            let flags = Int32(ptr!.pointee.ifa_flags)
            var addr = ptr!.pointee.ifa_addr.pointee
            if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                        if let address = String(validatingUTF8: hostname) {
                            addresses.append(address)
                        }
                    }
                }
            }
            ptr = ptr!.pointee.ifa_next
        }
        freeifaddrs(ifaddr)
        
        return addresses.first
    }
    
    /// 裝置機型
    /// https://www.theiphonewiki.com/wiki/Models
    /// https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else {
                return identifier
            }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        // swiftlint:disable:this cyclomatic_complexity
        func mapToDevice(identifier: String) -> String {
            switch identifier {
            case "iPod5,1": return "iPod touch 5"
            case "iPod7,1": return "iPod touch 6"
            case "iPod9,1": return "iPod touch 7"
                
            case "iPhone3,1": return "iPhone 4"
            case "iPhone3,2": return "iPhone 4"
            case "iPhone3,3": return "iPhone 4"
            case "iPhone4,1": return "iPhone 4s"
            case "iPhone5,1": return "iPhone 5"
            case "iPhone5,2": return "iPhone 5"
            case "iPhone5,3": return "iPhone 5c"
            case "iPhone5,4": return "iPhone 5c"
            case "iPhone6,1": return "iPhone 5s"
            case "iPhone6,2": return "iPhone 5s"
            case "iPhone7,1": return "iPhone 6 Plus"
            case "iPhone7,2": return "iPhone 6"
            case "iPhone8,1": return "iPhone 6s"
            case "iPhone8,2": return "iPhone 6s Plus"
            case "iPhone8,4": return "iPhone SE"
            case "iPhone9,1": return "iPhone 7"
            case "iPhone9,2": return "iPhone 7 Plus"
            case "iPhone9,3": return "iPhone 7"
            case "iPhone9,4": return "iPhone 7 Plus"
                
            case "iPhone10,1": return "iPhone 8"
            case "iPhone10,2": return "iPhone 8 Plus"
            case "iPhone10,3": return "iPhone X"
            case "iPhone10,4": return "iPhone 8"
            case "iPhone10,5": return "iPhone 8 Plus"
            case "iPhone10,6": return "iPhone X"
            case "iPhone11,2": return "iPhone XS"
            case "iPhone11,4": return "iPhone XS Max"
            case "iPhone11,6": return "iPhone XS Max"
            case "iPhone11,8": return "iPhone XR"
            case "iPhone12,1": return "iPhone 11"
            case "iPhone12,3": return "iPhone 11 Pro"
            case "iPhone12,5": return "iPhone 11 Pro Max"
            case "iPhone12,8": return "iPhone SE 2"
            case "iPhone13,1": return "iPhone 12 mini"
            case "iPhone13,2": return "iPhone 12"
            case "iPhone13,3": return "iPhone 12 Pro"
            case "iPhone13,4": return "iPhone 12 Pro Max"
                
            case "iPad1,1":  return "iPad 1"
            case "iPad2,1":  return "iPad 2 (WiFi)"
            case "iPad2,2":  return "iPad 2 (GSM)"
            case "iPad2,3":  return "iPad 2 (CDMA)"
            case "iPad2,4":  return "iPad 2"
            case "iPad2,5":  return "iPad mini 1"
            case "iPad2,6":  return "iPad mini 1"
            case "iPad2,7":  return "iPad mini 1"
            case "iPad3,1":  return "iPad 3 (WiFi)"
            case "iPad3,2":  return "iPad 3 (4G)"
            case "iPad3,3":  return "iPad 3 (4G)"
            case "iPad3,4":  return "iPad 4"
            case "iPad3,5":  return "iPad 4"
            case "iPad3,6":  return "iPad 4"
            case "iPad4,1":  return "iPad Air"
            case "iPad4,2":  return "iPad Air"
            case "iPad4,3":  return "iPad Air"
            case "iPad4,4":  return "iPad mini 2"
            case "iPad4,5":  return "iPad mini 2"
            case "iPad4,6":  return "iPad mini 2"
            case "iPad4,7":  return "iPad mini 3"
            case "iPad4,8":  return "iPad mini 3"
            case "iPad4,9":  return "iPad mini 3"
            case "iPad5,1":  return "iPad mini 4"
            case "iPad5,2":  return "iPad mini 4"
            case "iPad5,3":  return "iPad Air 2"
            case "iPad5,4":  return "iPad Air 2"
            case "iPad6,3":  return "iPad Pro (9.7 inch)"
            case "iPad6,4":  return "iPad Pro (9.7 inch)"
            case "iPad6,7":  return "iPad Pro (12.9 inch)"
            case "iPad6,8":  return "iPad Pro (12.9 inch)"
            case "iPad6,11": return "iPad 5"
            case "iPad6,12": return "iPad 5"
            case "iPad7,1":  return "iPad Pro 2 (12.9 inch)"
            case "iPad7,2":  return "iPad Pro 2 (12.9 inch)"
            case "iPad7,3":  return "iPad Pro (10.5 inch)"
            case "iPad7,4":  return "iPad Pro (10.5 inch)"
            case "iPad7,5":  return "iPad 6"
            case "iPad7,6":  return "iPad 6"
            case "iPad7,11": return "iPad 7"
            case "iPad7,12": return "iPad 7"
            case "iPad8,1":  return "iPad Pro 1 (11 inch)"
            case "iPad8,2":  return "iPad Pro 1 (11 inch)"
            case "iPad8,3":  return "iPad Pro 1 (11 inch)"
            case "iPad8,4":  return "iPad Pro 1 (11 inch)"
            case "iPad8,5":  return "iPad Pro 3 (12.9 inch)"
            case "iPad8,6":  return "iPad Pro 3 (12.9 inch)"
            case "iPad8,7":  return "iPad Pro 3 (12.9 inch)"
            case "iPad8,8":  return "iPad Pro 3 (12.9 inch)"
            case "iPad8,9":  return "iPad Pro 2 (11 inch)"
            case "iPad8,10": return "iPad Pro 2 (11 inch)"
            case "iPad8,11": return "iPad Pro 4 (12.9 inch)"
            case "iPad8,12": return "iPad Pro 4 (12.9 inch)"
            case "iPad11,1": return "iPad mini 5"
            case "iPad11,2": return "iPad mini 5"
            case "iPad11,3": return "iPad Air 3"
            case "iPad11,4": return "iPad Air 3"
            case "iPad11,6": return "iPad 8"
            case "iPad11,7": return "iPad 8"
                
            case "AppleTV5,3": return "Apple TV"
            case "AppleTV6,2": return "Apple TV 4K"
                
            case "AudioAccessory1,1": return "HomePod"
            case "AudioAccessory5,1": return "HomePod mini"
                
            case "i386": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "Simulator x86"))"
            case "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "Simulator x64"))"
            default: return identifier
            }
        }
        
        return mapToDevice(identifier: identifier)
    }
    
    var isiPhoneX: Bool {
        return UIDevice.homeIndicatorHeight > 0
    }
    
    /// iPhoneX系列 Home Indicator 高度
    /// iPhoneX = 34
    /// iPhone = 0
    static var homeIndicatorHeight: CGFloat {
        return UIApplication.shared.originalKeyWindow?.safeAreaInsets.bottom ?? 0
    }
    
    /// iPhone 的 notch 高度（也是狀態欄高度）
    /// iPhoneX = 44
    /// iPhone = 20
    static var notchHeight: CGFloat {
        return UIApplication.shared.originalKeyWindow?.safeAreaInsets.top ?? 0
    }
    
    /// 強制旋轉方向
    func forceOrientation(to orientation: UIInterfaceOrientation) {
        setValue(orientation.rawValue, forKey: "orientation")
    }
    
    /// 強制豎屏
    func forceOrientationToProtrait() {
        forceOrientation(to: .portrait)
    }
    
    /// 強制橫屏
    func forceOrientationToLandscape() {
        forceOrientation(to: .landscapeRight)
    }
}

extension UIUserInterfaceIdiom {
    var stringValue: String {
        switch self {
        case .phone:    return "iPhone"
        case .pad:      return "iPad"
        case .tv:       return "AppleTV"
        case .carPlay:  return "CarPlay"
        case .mac:      return "Mac"
        default:        return "Unspecified"
        }
    }
}
