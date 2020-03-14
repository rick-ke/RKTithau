//
//  UIControl+RKAdd.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIControl {
    typealias Handler = () -> Void
    
    private static var closureKey = "kUIControlClosure"
    private var closure: Handler {
        get {
            return objc_getAssociatedObject(self, &UIControl.closureKey) as! Handler
        }
        set {
            objc_setAssociatedObject(self, &UIControl.closureKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func touchHandler(_ handler: @escaping Handler) {
        closure = handler
        addTarget(self, action: #selector(actionControl), for: .touchUpInside)
    }
    
    @objc private func actionControl() {
        closure()
    }
}
