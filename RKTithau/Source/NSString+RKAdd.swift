//
//  NSString+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension NSString {
    @objc var toNSDate: NSDate {
        let str = self as String
        return (str.toDate ?? Date()) as NSDate
    }
}
