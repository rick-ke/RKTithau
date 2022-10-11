//
//  CALayer+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import UIKit

extension CALayer {
    func resumeAnimation() {
        if speed == 1.0 {
            return
        }
        let pauseTime = timeOffset
        speed = 1.0
        timeOffset = 0.0
        let timeSincePause = convertTime(CACurrentMediaTime(), from: nil) - pauseTime
        beginTime = timeSincePause
    }
    
    func pauseAnimation() {
        if speed == 0.0 {
            return
        }
        let pauseTime = convertTime(CACurrentMediaTime(), from: nil)
        speed = 0.0
        timeOffset = pauseTime
    }
}
