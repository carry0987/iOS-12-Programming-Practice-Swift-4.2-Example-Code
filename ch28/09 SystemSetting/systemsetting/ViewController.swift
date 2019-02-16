//
//  ViewController.swift
//  SystemSetting
//
//  Created by ChuKoKang on 2016/7/24.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 取得 name_preference 的Item設定值
        let user = UserDefaults.standard
        var title = user.string(forKey: "name_preference")
        
        // 改為大寫
        title = title?.uppercased()
        
        // 將修改後的資料寫回去
        user.set(title, forKey: "name_preference")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

