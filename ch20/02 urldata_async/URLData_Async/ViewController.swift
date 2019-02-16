//
//  ViewController.swift
//  URLData_Async
//
//  Created by ChuKoKang on 2016/7/18.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://www.apple.com")
        // 使用預設的設定建立 session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        // NSURLSessionDataTask 為讀取資料，讀取完成的資料會放在 data 中
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // 注意此 block 區段已在另外一個執行緒
            if error == nil {
                var html: String? = nil
                if let data = data {
                    html = String(data: data, encoding: .utf8)
                }
                print(html ?? "")
            } else {
                print("資料讀取失敗")
            }
        }
        
        // 開始讀取資料
        dataTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

