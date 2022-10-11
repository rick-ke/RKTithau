//
//  UIActivityIndicatorView+Style.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    enum IndicatorStyle {
        case medium
        case large
    }
    
    func setStyle(_ indicatorStyle: IndicatorStyle) {
        switch indicatorStyle {
        case .medium:
            if #available(iOS 13.0, *) {
                style = .medium
            } else {
                style = .white
            }
        case .large:
            if #available(iOS 13.0, *) {
                style = .large
            } else {
                style = .whiteLarge
            }
        }
    }
}
