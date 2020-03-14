//
//  Data+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import Foundation

extension Data {
    var toBase64: String? {
        return self.base64EncodedString()
    }
}
