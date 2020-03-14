//
//  CGFloat+Decimal.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension CGFloat {
    func floor(toDecimal decimal: Int) -> CGFloat {
        let numberOfDigits = pow(10.0, CGFloat(decimal))
        return (self * numberOfDigits).rounded(.towardZero) / numberOfDigits
    }
}
