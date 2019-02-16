//
//  ViewController.swift
//  Calendar
//
//  Created by ChuKoKang on 2016/7/24.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 取得本地時區的日曆
        let calendar = Calendar.current
        
        // 設定要取得 calendar 中的年、月、日
        var set = Set<Calendar.Component>()
        set.insert(Calendar.Component.year)
        set.insert(Calendar.Component.month)
        set.insert(Calendar.Component.day)
        
        let c = calendar.dateComponents(set, from: Date())
        print("\(c.year!)年\(c.month!)月\(c.day!)日")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

