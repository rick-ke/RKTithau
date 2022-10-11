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
    
    var toUtf8: String? {
        return String(data: self, encoding: .utf8)
    }
    
    var toJsonStringPretty: String? {
        let ropt: JSONSerialization.ReadingOptions = [
            .mutableContainers
        ]
        let wopt: JSONSerialization.WritingOptions = [
            .prettyPrinted,
            .sortedKeys,
            .withoutEscapingSlashes,
            .fragmentsAllowed
        ]
        guard let jsonObj = try? JSONSerialization.jsonObject(with: self, options: ropt),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObj, options: wopt),
              let string = String(data: jsonData, encoding: .utf8)
        else {
            return nil
        }
        return string
    }
    
    var toJsonObject: JsonObject? {
        let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers)
        return json as? JsonObject
    }
    
    var toDictionary: [String: Any]? {
        let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers)
        let dic = json as? [String: Any]
        return dic
    }
}
