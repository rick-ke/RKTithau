//
//  Collection+Safe.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

public struct SafeCollectionable<Base> where Base: Collection {
    let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
    
    public subscript(_ index: Base.Index) -> Base.Element? {
        if !base.indices.contains(index) {
            return nil
        }
        return base[index]
    }
}

public extension Collection {
    var safe: SafeCollectionable<Self> {
        return SafeCollectionable(self)
    }
}
