//
//  TimeInterval+Clock.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension TimeInterval {
    enum FormatType {
        case HHmmss
        case mmss
        case ss
    }
    
    func toFormat(_ formatType: FormatType) -> String {
        switch formatType {
        case .HHmmss:
            return toFormat_HHmmss()
        case .mmss:
            return toFormat_mmss()
        case .ss:
            return toFormat_ss()
        }
    }
    
    /// 轉換成 HH:mm:ss
    private func toFormat_HHmmss() -> String {
        let hours = Int(self / 3600)
        let minutes = Int((self.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(self.truncatingRemainder(dividingBy: 60))
        
        if hours != 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    /// 轉換成 mm:ss
    private func toFormat_mmss() -> String {
        let minutes = Int((self.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(self.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    /// 轉換成 ss
    private func toFormat_ss() -> String {
        let seconds = Int(self.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d", seconds)
    }
}
