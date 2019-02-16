//
//  MyOperation.swift
//  CustomOperationQueue
//
//  Created by ChuKoKang on 2016/7/6.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class MyOperation: Operation {
    private var range: (from: Int, to: Int)
    
    init(from: Int, to: Int) {
        range.from = from
        range.to = to
    }
    
    override func main() {
        for i in range.from ... range.to {
            print(i)
        }
    }
}
