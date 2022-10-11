//
//  NSObject+ClassName.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import Foundation

protocol RKClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension NSObject: RKClassNameProtocol {}

extension RKClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject {
    func isKind(of aClassName: String) -> Bool {
        guard let aClass = NSClassFromString(aClassName) else {
            return false
        }
        return isKind(of: aClass)
    }
}
