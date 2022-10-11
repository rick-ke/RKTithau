//
//  CGFloat+Decimal.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension CGFloat {
    var toInteger: Int {
        return Int(self)
    }
    
    var toDouble: Double {
        return Double(self)
    }
    
    func floor(toDecimal decimal: Int) -> CGFloat {
        let numberOfDigits = pow(10.0, CGFloat(decimal))
        return (self * numberOfDigits).rounded(.towardZero) / numberOfDigits
    }
}
