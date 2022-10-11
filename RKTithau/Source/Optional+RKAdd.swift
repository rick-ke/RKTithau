//
//  Optional+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension Optional {
    /// 可選值非空返回 true
    var isSome: Bool {
        switch self {
        case .none: return false
        case .some: return true
        }
    }
    
    /// 可選值為空的時候返回 true
    var isNone: Bool {
        return !isSome
    }
}
