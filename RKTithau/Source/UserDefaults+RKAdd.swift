//
//  UserDefaults+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension UserDefaults {
    func string(forKey key: String) -> String? {
        return self.object(forKey: key) as? String
    }
}
