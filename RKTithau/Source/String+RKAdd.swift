//
//  String+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import Foundation

extension String {
    var toUrl: URL? {
        let link = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
        return URL(string: link)
    }
    
    var toBool: Bool {
        return self != "0"
    }

    var toInteger: Int {
        return (self as NSString).integerValue
    }
    
    func toDate(_ type: RKDateFormatterType) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = type.string
        return formatter.date(from: self)
    }
    
    /// How many characters to take
    func substring(count: Int) -> String {
        if count < self.count {
            let end = self.index(self.startIndex, offsetBy: count)
            return String(self[..<end])
        } else {
            return self
        }
    }
}
