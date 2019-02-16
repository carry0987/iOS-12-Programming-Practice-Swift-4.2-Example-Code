//
//  ViewController.swift
//  URLData_Save
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
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // 下載資料後存檔在 tmp/ 目錄，完整路徑在路徑在location 參數中
        let dnTask = session.downloadTask(with: url!) { (location, response, error) in
            // 注意此 block 區段已在另外一個執行緒
            if error == nil {
                if let location = location {
                    do {
                        let string = try String(contentsOf: location)
                        print(string)
                    } catch {
                        print(error)
                    }
                }
            } else {
                print("讀取資料錯誤")
            }
        }
        
        // 開始執行
        dnTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

