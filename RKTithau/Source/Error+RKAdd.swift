//
//  Error+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension Error {
    var code: Int {
        return (self as NSError).code
    }
}
