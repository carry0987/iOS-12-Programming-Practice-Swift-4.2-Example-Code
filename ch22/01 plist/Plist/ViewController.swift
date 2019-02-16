//
//  ViewController.swift
//  Plist
//
//  Created by ChuKoKang on 2016/8/1.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 取得已經複製到家目錄下Documents資料夾中的Property List.plist路徑
        let path = NSHomeDirectory() + "/Documents/Property List.plist"
        if let plist = NSMutableDictionary(contentsOfFile: path) {
            // 將 Color 資料讀出
            if let color = plist["Color"] {
                print("The color is \(color)")
            }
            
            // 修改 Color 資料
            plist["Color"] = "Green"
            if plist.write(toFile: path, atomically: true) {
                print("修改顏色成功")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

