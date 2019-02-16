//
//  ViewController.swift
//  Random
//
//  Created by ChuKoKang on 2016/7/28.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* 以下需設定亂數種子 */
        // 範圍 0 ~ 1 之間小數
        srand48(Int(Date().timeIntervalSince1970))
        let d: Double = drand48()
        print(d)
        
        /* 以下不需設定亂數種子 */
        // 範圍 0 ~ UInt32 最大範圍間整數
        let n1: UInt32 = arc4random()
        print(n1)
        
        // 輸入參數 10，產生一個範圍 0 ~ 9 之間整數
        let n2: UInt32 = arc4random_uniform(10)
        print(n2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

