//
//  UIControl+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

private var kTouchClosureKey: Void?

extension UIControl {
    enum TouchEventType {
        case down, downRepeat, dragInside, dragOutside, dragEnter, dragExit, upInside, upOutside, cancel
        
        var nativeEvent: UIControl.Event {
            switch self {
            case .down:             return .touchDown
            case .downRepeat:       return .touchDownRepeat
            case .dragInside:       return .touchDragInside
            case .dragOutside:      return .touchDragOutside
            case .dragEnter:        return .touchDragEnter
            case .dragExit:         return .touchDragExit
            case .upInside:         return .touchUpInside
            case .upOutside:        return .touchUpOutside
            case .cancel:           return .touchCancel
            }
        }
    }
    
    private var controlTouchClosure: Handler? {
        get { return getAssociatedObject(self, &kTouchClosureKey) }
        set { setRetainedAssociatedObject(self, &kTouchClosureKey, newValue) }
    }
    
    func touch(_ event: TouchEventType, handler: @escaping Handler) {
        controlTouchClosure = handler
        self.addTarget(self, action: #selector(touchActionControl), for: event.nativeEvent)
    }
    
    func touchUpInside(handler: @escaping Handler) {
        touch(.upInside, handler: handler)
    }
    
    @objc private func touchActionControl() {
        controlTouchClosure?()
    }
}
