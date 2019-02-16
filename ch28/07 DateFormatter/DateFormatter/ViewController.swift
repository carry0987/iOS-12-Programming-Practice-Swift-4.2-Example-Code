//
//  ViewController.swift
//  DateFormatter
//
//  Created by ChuKoKang on 2016/7/24.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 將 Date 格式轉成字串
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d H:m:s"
        let string = formatter.string(from: Date())
        print("現在（本地）時間: \(string)")
        
        // 將字串轉成 Date 格式
        let date = formatter.date(from: "2017/1/1 18:0:0")
        // 注意：字串為本地時間，轉換後的 date 為格林威治時間
        print(date!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

