//
//  AVPlayer+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import AVFoundation

extension AVPlayer {
    /// 幀率
    var fps: Float? {
        let asset = currentItem?.asset
        let tracks = asset?.tracks(withMediaType: .video)
        let fps = tracks?.first?.nominalFrameRate
        return fps
    }
    
    /// 設置播放速度
    func play(atRate value: Float) {
        if rate != value {
            playImmediately(atRate: value)
        }
    }
}
