//
//  Int+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension Int {
    var toBool: Bool {
        return (self as NSNumber).boolValue
    }
    
    var toCGFloat: CGFloat {
        return CGFloat(self)
    }
    
    var toDouble: Double {
        return Double(self)
    }
    
    var toString: String {
        return (self as NSNumber).stringValue
    }
}
