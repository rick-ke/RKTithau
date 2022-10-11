//
//  NotificationCenter+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension NotificationCenter {
    func post(name: Notification.Name) {
        post(name: name, object: nil)
    }
}
