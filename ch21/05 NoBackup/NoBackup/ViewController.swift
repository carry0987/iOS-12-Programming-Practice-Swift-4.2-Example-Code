//
//  ViewController.swift
//  NoBackup
//
//  Created by ChuKoKang on 2016/7/19.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        let fm = FileManager.default
        let filename = NSHomeDirectory() + "/Documents/a.txt"
        
        // 先建立 a.txt 檔案
        fm.createFile(atPath: filename, contents: nil, attributes: nil)
        // 將 a.txt 的絕對路徑轉成 URL 格式
        var url = URL(fileURLWithPath: filename)
        // 設定 a.txt 為不用備份
        do {
            var values = URLResourceValues()
            values.isExcludedFromBackup = true
            try url.setResourceValues(values)
        } catch {
            print("設定失敗")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

