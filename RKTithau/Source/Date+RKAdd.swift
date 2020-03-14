//
//  Date+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import Foundation

enum RKDateFormatterType {
    /// MM-dd
    case MMddDash
    /// MM-dd HH:mm:ss
    case MMddDashHHmmss
    /// yyyy-MM-dd
    case yyyyMMddDash
    /// yyyy/MM/dd
    case yyyyMMddSlash
    /// yyyy-MM-dd HH:mm
    case yyyyMMddDashHHmm
    /// yyyy-MM-dd HH:mm:ss
    case yyyyMMddDashHHmmss
    /// yyyy-MM-dd 00:00:00
    case yyyyMMddDash000000
    
    var string: String {
        switch self {
        case .MMddDash:                 return "MM-dd"
        case .MMddDashHHmmss:           return "MM-dd HH:mm:ss"
        case .yyyyMMddDash:             return "yyyy-MM-dd"
        case .yyyyMMddSlash:            return "yyyy/MM/dd"
        case .yyyyMMddDashHHmm:         return "yyyy-MM-dd HH:mm"
        case .yyyyMMddDashHHmmss:       return "yyyy-MM-dd HH:mm:ss"
        case .yyyyMMddDash000000:       return "yyyy-MM-dd 00:00:00"
        }
    }
}

extension Date {
    func toString(_ type: RKDateFormatterType) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = type.string
        return formatter.string(from: self)
    }
    
    var toComponents: DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.dateComponents([.year, .month, .day], from: self)
    }
}
