//
//  ViewController.swift
//  URLData_Sync
//
//  Created by ChuKoKang on 2016/7/18.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            // 文字
            let url = URL(string: "https://www.apple.com")
            let html = try String(contentsOf: url!)

            // 圖片
            let urlImg = URL(string: "https://someurl.com/a.jpg")
            // 如果傳回的是二位元格式資料，例如圖片，就使用 Data 類別處理
            let data = try Data(contentsOf: urlImg!)
            let image = UIImage(data: data)
        } catch {
            print("***\(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

