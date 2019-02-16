//
//  ViewController.swift
//  Big5
//
//  Created by KoKang Chu on 2017/7/19.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let value = CFStringEncoding(CFStringEncodings.big5.rawValue)
        let big5 = CFStringConvertEncodingToNSStringEncoding(value)
        
        // 將 String 以 big5 編碼轉成 Data
        let data = "中文".data(using: String.Encoding(rawValue: big5))
        // big5 編碼的 Data 轉成 string
        let string = String(data: data!, encoding: String.Encoding(rawValue: big5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

