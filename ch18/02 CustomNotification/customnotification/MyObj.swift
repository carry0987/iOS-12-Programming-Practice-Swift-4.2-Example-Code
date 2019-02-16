//
//  MyObj.swift
//  CustomNotification
//
//  Created by KoKang Chu on 2017/7/18.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class MyObj: NSObject {
    @objc func receiveNotification(_ notification: Notification) {
        if let num = notification.object as? NSNumber {
            print("Name: \(notification.name), Value: \(num.intValue)")
        }
    }
}
