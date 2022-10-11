//
//  Date+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import Foundation

extension Date {
    enum RKDateFormatterType {
        /// yyyy
        case yyyy
        /// MM
        case MM
        /// dd
        case dd
        /// MM-dd
        case MMddDash
        /// MM-dd HH:mm
        case MMddDashHHmm
        /// MM-dd HH:mm:ss
        case MMddDashHHmmss
        /// yyyy-MM
        case yyyyMMDash
        /// yyyy-MM-dd
        case yyyyMMddDash
        /// yyyy/MM/dd
        case yyyyMMddSlashS
        /// yyyy / MM / dd
        case yyyyMMddSlashL
        /// yyyy-MM-dd HH:mm
        case yyyyMMddDashHHmm
        /// yyyy-MM-dd HH:mm:ss
        case yyyyMMddDashHHmmss
        /// yyyy-MM-dd 00:00:00
        case yyyyMMddDash000000
        /// yyyy.MM.dd HH:mm
        case yyyyMMddDotHHmm
        /// ddMMMyyyy
        case ddMMMyyyy
        /// yyyy年
        case yyyyChinese
        /// MM月
        case MMChinese
        /// yyyy年MM月
        case yyyyMMChinese
        /// yyyy年MM月dd日
        case yyyyMMddChinese
        
        var string: String {
            switch self {
            case .yyyy:                     return "yyyy"
            case .MM:                       return "MM"
            case .dd:                       return "dd"
            case .MMddDash:                 return "MM-dd"
            case .MMddDashHHmm:             return "MM-dd HH:mm"
            case .MMddDashHHmmss:           return "MM-dd HH:mm:ss"
            case .yyyyMMDash:               return "yyyy-MM"
            case .yyyyMMddDash:             return "yyyy-MM-dd"
            case .yyyyMMddSlashS:           return "yyyy/MM/dd"
            case .yyyyMMddSlashL:           return "yyyy / MM / dd"
            case .yyyyMMddDashHHmm:         return "yyyy-MM-dd HH:mm"
            case .yyyyMMddDashHHmmss:       return "yyyy-MM-dd HH:mm:ss"
            case .yyyyMMddDash000000:       return "yyyy-MM-dd 00:00:00"
            case .yyyyMMddDotHHmm:          return "yyyy.MM.dd HH:mm"
            case .yyyyChinese:              return "yyyy年"
            case .MMChinese:                return "MM月"
            case .yyyyMMChinese:            return "yyyy年MM月"
            case .yyyyMMddChinese:          return "yyyy年MM月dd日"
            case .ddMMMyyyy:                return "ddMMM.yyyy"
            }
        }
    }
    
    func toString(_ type: Date.RKDateFormatterType) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = type.string
        return formatter.string(from: self)
    }
    
    var toComponents: DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.dateComponents([.year, .month, .day], from: self)
    }
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    /// 是否為今天
    var isToday: Bool {
        if fabs(timeIntervalSinceNow) >= 60 * 60 * 24 {
            return false
        }
        return self.day == Date().day
    }
    
    /// 為過去時間
    var isThePast: Bool {
      return timeIntervalSinceNow < 0
    }
    
    /// 為未來時間
    var isTheFuture: Bool {
      return timeIntervalSinceNow > 0
    }
    
    /// 是否為本月
    var isThisMonth: Bool {
        let nowDate = Date()
        if self.year == nowDate.year && self.month == nowDate.month {
            return true
        }
        return false
    }
    
    /// 每個月分有多少天
    var daysInMonth: Int {
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 4, 6, 9, 11:
            return 30
        case 2:
            let isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
            return isLeapYear ? 29 : 28
        default:
            fatalError("非法的月份: \(month)")
        }
    }
    
    func adding(_ value: Int, _ component: Calendar.Component) -> Date {
        return Calendar.current.date(byAdding: component, value: value, to: self) ?? Date()
    }
}

extension String {
    func toDate(_ type: Date.RKDateFormatterType) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = type.string
        return formatter.date(from: self)
    }
    
    /// 通用的轉型
    /// 輸入 yyyy-MM-dd 或 yyyy-MM 或 yyyy-MM-dd HH:mm:ss 或 yyyy / MM / dd 或 yyyy/MM/dd
    /// 輸出 Date?
    var toDate: Date? {
        if let date = self.toDate(.yyyyMMddDash) {
            return date
        }
        if let date = self.toDate(.yyyyMMDash) {
            return date
        }
        if let date = self.toDate(.yyyyMMddDashHHmmss) {
            return date
        }
        if let date = self.toDate(.yyyyMMddSlashL) {
            return date
        }
        if let date = self.toDate(.yyyyMMddSlashS) {
            return date
        }
        return nil
    }
}
