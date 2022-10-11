//
//  FileManager+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension FileManager {
    static let homeURL: URL = {
        return URL(string: NSHomeDirectory())!
    }()
    
    static let homePath: String = {
        return NSHomeDirectory()
    }()
    
    /// App 的『Documents』路徑
    /// 把 file:// 拿掉, 後面的路徑可從電腦的搜尋
    static let documentsURL: URL = {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
    }()
    
    static let documentsPath: String = {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
    }()
    
    static let cachesURL: URL = {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).last!
    }()
    
    static let cachesPath: String = {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!
    }()
    
    static let libraryURL: URL = {
        return FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last!
    }()
    
    static let libraryPath: String = {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last!
    }()
    
    static let tempURL: URL = {
        return URL(string: NSTemporaryDirectory())!
    }()
    
    static let tempPath: String = {
        return NSTemporaryDirectory()
    }()
}
