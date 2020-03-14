//
//  Dictionary+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import Foundation

extension Dictionary {
    /// Is an empty dictionary
    var isEmpty: Bool {
        return self.count == 0
    }
    
    var toJsonData: Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            printError(msg: "Dictionary is invalid JSONObject")
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return data
        } catch {
            printError(msg: error)
            return nil
        }
    }
    
    var toJsonString: String? {
        guard let jsonData = self.toJsonData else { return nil }
        let jsonString = String(bytes: jsonData, encoding: .utf8)
        return jsonString?
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "\n", with: "")
    }
    
    func decode<T: Decodable>(_ model: T.Type) -> T? {
        guard let jsonData = self.toJsonData else { return nil }
        do {
            let model = try JSONDecoder().decode(model.self, from: jsonData)
            return model
        } catch {
            printError(msg: "[\(model)] \(error)")
            return nil
        }
    }
}

func += <K, V> (left: inout [K: V], right: [K: V]) {
    for (k, v) in right {
        left[k] = v
    }
}

func + <K, V> (left: [K: V], right: [K: V]) -> [K: V] {
    var new = left
    for (k, v) in right {
        new[k] = v
    }
    return new
}
