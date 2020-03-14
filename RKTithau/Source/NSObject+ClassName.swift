//
//  NSObject+ClassName.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import Foundation

protocol SPClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension NSObject: SPClassNameProtocol {}

extension SPClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
