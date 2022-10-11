//
//  NotificationName+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let appDidEnterBackground: NSNotification.Name = {
        return UIApplication.didEnterBackgroundNotification
    }()
    
    static let appWillEnterForeground: NSNotification.Name = {
        return UIApplication.willEnterForegroundNotification
    }()
    
    static let appDidFinishLaunching: NSNotification.Name = {
        return UIApplication.didFinishLaunchingNotification
    }()
    
    static let appDidBecomeActive: NSNotification.Name = {
        return UIApplication.didBecomeActiveNotification
    }()
    
    static let appWillResignActive: NSNotification.Name = {
        return UIApplication.willResignActiveNotification
    }()
    
    static let appDidReceiveMemoryWarning: NSNotification.Name = {
        return UIApplication.didReceiveMemoryWarningNotification
    }()
    
    static let appWillTerminate: NSNotification.Name = {
        return UIApplication.willTerminateNotification
    }()
    
    static let appSignificantTimeChange: NSNotification.Name = {
        return UIApplication.significantTimeChangeNotification
    }()
    
    static let appBackgroundRefreshStatusDidChange: NSNotification.Name = {
        return UIApplication.significantTimeChangeNotification
    }()
    
    static let appProtectedDataWillBecomeUnavailable: NSNotification.Name = {
        return UIApplication.significantTimeChangeNotification
    }()
    
    static let appProtectedDataDidBecomeAvailable: NSNotification.Name = {
        return UIApplication.significantTimeChangeNotification
    }()
    
    static let appUserDidTakeScreenshot: NSNotification.Name = {
        return UIApplication.significantTimeChangeNotification
    }()
}
