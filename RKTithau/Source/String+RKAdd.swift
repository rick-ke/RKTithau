//
//  String+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import Foundation

extension String {
    var toURL: URL? {
        let link = self.encodeURL() ?? self
        return URL(string: link)
    }
    
    var toBool: Bool {
        let int = (self as NSString).integerValue
        return (int as NSNumber).boolValue
    }

    /// 轉換成 Integer, 字串中可能包含千分位符號, 所以先移除逗號
    var toInteger: Int {
        return (removeDot as NSString).integerValue
    }
    
    /// 轉換成 Double, 字串中可能包含千分位符號, 所以先移除逗號
    var toDouble: Double {
        return (removeDot as NSString).doubleValue
    }
    
    /// 移除逗號
    var removeDot: String {
        return self.replacingOccurrences(of: ",", with: "")
    }
    
    /// 是否空白內文（移除空格與換行符號）
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
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
    
    /// 替換字串
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}

extension String {
    /// 編碼成URL格式
    func encodeURL() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
    /// 從URL格式解碼成原來樣式
    func decodeURL() -> String? {
        return self.removingPercentEncoding
    }
}

extension String {
    func match(to expression: String) -> String {
        return match(as: expression) ?? ""
    }
    
    func match(as expression: String) -> String? {
        let range = NSRange(location: 0, length: self.utf16.count)
        do {
            let regex = try NSRegularExpression(pattern: expression, options: .init())
            let results = regex.matches(in: self, options: .init(), range: range)
            if let result = results.first, let matchRange = Range(result.range, in: self) {
                return String(self[matchRange])
            } else {
                return nil
            }
        } catch {
             return nil
        }
    }
    
    func matchs(expression: String) -> [String] {
        let range = NSRange(location: 0, length: self.utf16.count)
        do {
            let regex = try NSRegularExpression(pattern: expression, options: .init())
            let results = regex.matches(in: self, options: .init(), range: range)
            var final = [String]()
            for result in results {
                if let matchRange = Range(result.range, in: self) {
                    final.append(String(self[matchRange]))
                }
            }
            return final
        } catch {
             return []
        }
    }
}

extension StringProtocol {
    /// subString
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    
    func nsrange(of searchString: String) -> NSRange {
        return (self as! NSString).range(of: searchString)
    }
}
