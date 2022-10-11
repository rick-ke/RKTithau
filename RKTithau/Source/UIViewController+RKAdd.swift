//
//  UIViewController+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import UIKit

private var kTabBageView: Void?

extension UIViewController {
    private var tabBageView: UIView? {
        get { return getAssociatedObject(self, &kTabBageView) }
        set { setRetainedAssociatedObject(self, &kTabBageView, newValue) }
    }

    @objc func tabBarItemShowBadge() {
        guard let tabBarItem = navigationController?.tabBarItem,
              let tabBarButton = tabBarItem.value(forKey: "view") as? UIView
        else {
            print(error: "找不到 UITabBarButton")
            return
        }
        
        if tabBageView.isSome {
            return
        }
        
        let midX = tabBarButton.bounds.midX
        let length: CGFloat = 8
        
        let bageView = UIView(color: .red)
        bageView.frame = CGRect(x: midX + 6, y: 2, width: length, height: length)
        bageView.setCornerRadius(length / 2)

        tabBarButton.addSubview(once: bageView)
        
        tabBageView = bageView
    }
    
    @objc func tabBarItemHiddenBadge() {
        tabBageView?.removeFromSuperview()
        tabBageView = nil
    }
}
