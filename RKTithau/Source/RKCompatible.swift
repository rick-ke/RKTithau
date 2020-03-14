//
//  RKCompatible.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/2/26.
//  Copyright © 2020 RickKe. All rights reserved.
//

import Foundation

/// Wrapper for RK compatible types. This type provides an extension entry point for
/// connivence methods in entire project.
public struct RKWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

/// Represents an object type that is compatible with RKWrapper. You can use `rk` property to get a
/// value in the namespace of RKWrapper.
public protocol RKCompatibleObject: AnyObject { }

extension RKCompatibleObject {
    /// Gets a namespace holder for RK compatible types.
    public var rk: RKWrapper<Self> {
        get { return RKWrapper(self) }
        set { }
    }
}

/// Represents a value type that is compatible with RKWrapper. You can use `rk` property to get a
/// value in the namespace of RKWrapper.
public protocol RKCompatibleValue {}

extension RKCompatibleValue {
    /// Gets a namespace holder for IVI compatible types.
    public var rk: RKWrapper<Self> {
        get { return RKWrapper(self) }
        set { }
    }
}
