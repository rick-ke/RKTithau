//
//  RKTimer.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

class RKTimer {
    typealias CountHandler = ((_ count: Int) -> Void)
    
    private var progressBlock: CountHandler?
    private var finishBlock: Handler?
    
    private var sourceTimer: DispatchSourceTimer!
    private var count: Int
    
    
    init(count: Int) {
        self.count = count
    }
    
    @discardableResult
    func onProgress(completion: CountHandler?) -> Self {
        progressBlock = completion
        return self
    }
    
    @discardableResult
    func onFinish(completion: Handler?) -> Self {
        finishBlock = completion
        return self
    }
    
    @discardableResult
    func resume() -> Self {
        sourceTimer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        sourceTimer.schedule(deadline: .now(), repeating: .seconds(1))
        sourceTimer.setEventHandler(handler: {
            DispatchQueue.main.safeAsync {
                if self.count <= 0 {
                    self.sourceTimer.cancel()
                    self.finishBlock?()
                } else {
                    self.progressBlock?(self.count)
                    self.count -= 1
                }
            }
        })
        sourceTimer.resume()
        return self
    }
    
    func cancel() {
        sourceTimer.cancel()
    }
}
