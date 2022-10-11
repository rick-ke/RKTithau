//
//  RKError.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

public enum RKError: Error {
    public enum DictionaryCastingFailureReason {
        case invalidJsonObject
        case jsonDataCastingJsonStringFailed
        
    }
    case dictionaryCastingFailure(reason: DictionaryCastingFailureReason)
}

extension RKError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .dictionaryCastingFailure(reason):
            return reason.localizedDescription
        }
    }
}

extension RKError.DictionaryCastingFailureReason {
    var localizedDescription: String {
        switch self {
        case .invalidJsonObject:
            return "Dictionary is invalid JSONObject"
        case .jsonDataCastingJsonStringFailed:
            return "Dictionary to JSONString failure"
        }
    }
}
