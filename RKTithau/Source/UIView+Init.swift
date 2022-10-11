//
//  UIView+Init.swift
//  RKTithau
//
//  Created by Rick Ke on 2020/3/15.
//  Copyright © 2020 RickKe. All rights reserved.
//

import UIKit

extension UIView {
    convenience init(color: UIColor?) {
        self.init()
        self.backgroundColor = color
    }
    
    convenience init(color: UIColor?, corner: CGFloat) {
        self.init(color: color)
        self.setCornerRadius(corner)
    }
    
    convenience init(size: CGSize) {
        self.init()
        self.frame.size = size
    }
}

extension UIView {
    func setCornerRadius(_ value: CGFloat) {
        layer.cornerRadius = value
        clipsToBounds = true
    }
    
    func setCornerRadius(_ value: CGFloat, corners: CACornerMask) {
        layer.cornerRadius = value
        layer.maskedCorners = corners
        clipsToBounds = true
    }
    
    func setCornerRadius(_ value: CGFloat, corners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: value, height: value))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
    /// subview 只會被加一次
    func addSubview(once view: UIView) {
        if !self.subviews.contains(view) {
            self.addSubview(view)
        }
    }
}

extension UIView {
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            let newFrame = CGRect(x: newValue, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
            frame = newFrame
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            let newFrame = CGRect(x: frame.origin.x, y: newValue, width: frame.size.width, height: frame.size.height)
            frame = newFrame
        }
    }
}


// MARK: - Tap
extension UIView {
    private static var viewTapClosureKey = "kUIViewTapClosure"
    private var viewTapClosure: Handler {
        get {
            return objc_getAssociatedObject(self, &UIControl.viewTapClosureKey) as! Handler
        }
        set {
            objc_setAssociatedObject(self, &UIControl.viewTapClosureKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func tap(handler: @escaping Handler) {
        viewTapClosure = handler
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapActionControl))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
    }
    
    @objc private func tapActionControl() {
        viewTapClosure()
    }
}

// MARK: - LongPress
extension UIView {
    private static var viewLongPressClosureKey = "kUIViewLongPressClosure"
    private var viewLongPressClosure: Handler {
        get {
            return objc_getAssociatedObject(self, &UIControl.viewLongPressClosureKey) as! Handler
        }
        set {
            objc_setAssociatedObject(self, &UIControl.viewLongPressClosureKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func longPress(handler: @escaping Handler) {
        viewLongPressClosure = handler
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressActionControl))
        self.addGestureRecognizer(longPress)
        self.isUserInteractionEnabled = true
    }
    
    @objc private func longPressActionControl() {
        viewLongPressClosure()
    }
}

// MARK: - Pan
extension UIView {
    private static var viewPanClosureKey = "kUIViewPanClosure"
    private var viewPanClosure: Handler {
        get {
            return objc_getAssociatedObject(self, &UIControl.viewPanClosureKey) as! Handler
        }
        set {
            objc_setAssociatedObject(self, &UIControl.viewPanClosureKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func pan(handler: @escaping Handler) {
        viewPanClosure = handler
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panActionControl))
        self.addGestureRecognizer(pan)
        self.isUserInteractionEnabled = true
    }

    @objc private func panActionControl() {
        viewPanClosure()
    }
}

// MARK: - Swipe
extension UIView {
    private static var viewSwipeClosureKey = "kUIViewSwipeClosure"
    private var viewSwipeClosure: Handler {
        get {
            return objc_getAssociatedObject(self, &UIControl.viewSwipeClosureKey) as! Handler
        }
        set {
            objc_setAssociatedObject(self, &UIControl.viewSwipeClosureKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func swipe(handler: @escaping Handler) {
        viewSwipeClosure = handler
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeActionControl))
        self.addGestureRecognizer(swipe)
        self.isUserInteractionEnabled = true
    }

    @objc private func swipeActionControl() {
        viewSwipeClosure()
    }
}

// MARK: - Rotation
extension UIView {
    private static var viewRotationClosureKey = "kUIViewRotationClosure"
    private var viewRotationClosure: Handler {
        get {
            return objc_getAssociatedObject(self, &UIControl.viewRotationClosureKey) as! Handler
        }
        set {
            objc_setAssociatedObject(self, &UIControl.viewRotationClosureKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func rotation(handler: @escaping Handler) {
        viewRotationClosure = handler
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rotationActionControl))
        self.addGestureRecognizer(rotation)
        self.isUserInteractionEnabled = true
    }

    @objc private func rotationActionControl() {
        viewRotationClosure()
    }
}

// MARK: - Pinch
extension UIView {
    private static var viewPinchClosureKey = "kUIViewPinchClosure"
    private var viewPinchClosure: Handler {
        get {
            return objc_getAssociatedObject(self, &UIControl.viewPinchClosureKey) as! Handler
        }
        set {
            objc_setAssociatedObject(self, &UIControl.viewPinchClosureKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func pinch(handler: @escaping Handler) {
        viewPinchClosure = handler
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchActionControl))
        self.addGestureRecognizer(pinch)
        self.isUserInteractionEnabled = true
    }
    
    @objc private func pinchActionControl() {
        viewPinchClosure()
    }
}
