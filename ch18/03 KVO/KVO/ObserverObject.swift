//
//  ObserverObject.swift
//  KVO
//
//  Created by KoKang Chu on 2017/7/18.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ObserverObject: NSObject {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        guard let object = object as? NSObject else {
            print("object is nil")
            return
        }

        let str = object.value(forKeyPath: keyPath!)
        print(str!)
        
        /*
        if keyPath == "str" {
            let old = change?[.oldKey]
            let new = change?[.newKey]
            print("舊的值: \(String(describing: old))")
            print("新的值: \(String(describing: new))")
        }
        */
    }

}
