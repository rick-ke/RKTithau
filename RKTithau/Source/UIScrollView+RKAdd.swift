//
//  UIScrollView+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import UIKit

extension UIScrollView: UIGestureRecognizerDelegate {
    /// 此方法返回YES时，手势事件会一直往下传递，不论当前层次是否对该事件进行响应。
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if let pan = gestureRecognizer as? UIPanGestureRecognizer, let _ = otherGestureRecognizer as? UIPanGestureRecognizer {
            if let isNavPan = otherGestureRecognizer.view?.isKind(of: "UILayoutContainerView"), isNavPan {
                let velocity = pan.velocity(in: self)
                if velocity.x > 0 {
                    return true
                }
            }
        }
        return false
    }
}
