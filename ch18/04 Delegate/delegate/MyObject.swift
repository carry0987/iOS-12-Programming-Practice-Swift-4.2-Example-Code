//
//  MyObject.swift
//  Delegate
//
//  Created by ChuKoKang on 2016/7/17.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

@objc
protocol MyObjectDelegate: NSObjectProtocol {
    // 必須實作
    func returnAnswer(object: MyObject, answer: Float)
    // 選擇性實作
    @objc optional func returnError(error: NSError?)
}


class MyObject: NSObject {
    var delegate: MyObjectDelegate?

    func divide(_ value: Float, by byValue: Float) {
        if byValue != 0 {
            delegate?.returnAnswer(
                object: self,
                answer: value / byValue)
        }
        
        if (delegate?.responds(to: #selector(MyObjectDelegate.returnError(error:))) != nil) {
            var error: NSError? = nil
            if byValue == 0 {
                error = NSError(
                    domain: "DoM",  // 字串自訂
                    code: 1,        // 數字自訂
                    userInfo: [NSLocalizedDescriptionKey: "分母為零"]
                )
            }
            delegate?.returnError!(error: error)
        }
    }
}
