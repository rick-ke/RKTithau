//
//  Array+Extension.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension Array {
    var minIndex: Array.Index {
        return 0
    }
    
    var maxIndex: Array.Index {
        return count == 0 ? 0 : count - 1
    }
    
    func nextIndex(at currentIndex: Int) -> Array.Index {
        if currentIndex < (count - 1) {
            return currentIndex + 1
        } else {
            return 0
        }
    }
    
    func nextElement(at currentIndex: Int) -> Element {
        let nextIndex = nextIndex(at: currentIndex)
        return self[nextIndex]
    }
}

extension Array where Element: Any {}

extension Array where Element: Comparable {}

extension Array where Element: Equatable {
    func isContain(_ element: Element) -> Bool {
        return contains(where: { $0 == element })
    }
    
    mutating func append(once newElement: Element) {
        if !isContain(newElement) {
            self.append(newElement)
        }
    }
    
    func index(of style: Element) -> Array.Index? {
        return firstIndex(of: style)
    }
    
    func element(at index: Int) -> Element? {
        return self[index]
    }
    
    mutating func remove(of style: Element) {
        if let index = index(of: style) {
            remove(at: index)
        }
    }
}
