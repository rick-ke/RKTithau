//
//  Bundle+Info.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension Bundle {
    struct Info {
        /// `Info` -> `InfoDictionary version`
        static var infoDictionaryVersion: String {
            return Bundle.main.infoDictionary?[kCFBundleInfoDictionaryVersionKey as String] as? String ?? "Unknown"
        }
        /// 開發語言環境
        /// `Info` -> `Localization native development region`
        static var developmentRegion: String {
            return Bundle.main.infoDictionary?[kCFBundleDevelopmentRegionKey as String] as? String ?? "Unknown"
        }
        /// `General` -> `Identity` -> `Bundle Identifier`
        static var boundleID: String {
            return Bundle.main.infoDictionary?[kCFBundleIdentifierKey as String] as? String ?? "Unknown"
        }
        /// Project Name
        static var bundleExecutable: String {
            return Bundle.main.infoDictionary?[kCFBundleExecutableKey as String] as? String ?? "Unknown"
        }
        /// 專案名稱
        /// `Info` -> `Bundle name`
        static var bundleName: String {
            return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String ?? "Unknown"
        }
        /// 多國語言
        static var bundleLocalizations: [String] {
            return Bundle.main.infoDictionary?[kCFBundleLocalizationsKey as String] as? [String] ?? ["Unknown"]
        }
        /// 建制版本
        /// `General` -> `Identity` -> `Build`
        static var buildVersion: String {
            return Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String ?? "0"
        }
        /// 版本號
        /// `General` -> `Identity` -> `Version`
        static var version: String {
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0"
        }
        /// 顯示名稱
        /// `Info` -> `Bundle display name`
        static var displayName: String {
            return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "Unknown"
        }
        /// Git Hash Key
        /// `Info` -> `MasterGitHashKey`
        static var masterHashNumber: String {
            var nsDictionary: NSDictionary?
            if let path = Bundle.main.path(forResource: "ONEConfig-Info", ofType: "plist") {
                nsDictionary = NSDictionary(contentsOfFile: path)
            }
            return (nsDictionary?["Master_Git_Hash_Key"] as? String) ?? ""
        }
    }
}

extension Bundle {
    static func contents(forResource name: String, ofType ext: String) -> String? {
        guard let path = Bundle.main.path(forResource: name, ofType: ext) else {
            print(error: "找不到檔案")
            return nil
        }
        guard let text = try? String(contentsOfFile: path) else {
            print(error: "讀取文件失敗")
            return nil
        }
        return text
    }
}
