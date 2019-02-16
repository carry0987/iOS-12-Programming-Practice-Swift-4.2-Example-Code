//
//  ViewController.swift
//  JSON
//
//  Created by KoKang Chu on 2017/7/19.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = Bundle.main.url(forResource: "json", withExtension: "txt")
        // (1) 讀取 JSON 字串
        do {
            let data = try Data(contentsOf: url!)
            // (2) 解析 JSON
            // JSON 解析後的資料型態只有兩種，字典或是字典陣列
            // 如果是字典陣列，使用迴圈就可以取得所有資料
            let jsonObj = try JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            ) as! Array<Dictionary<String, AnyObject>>
            
            // (3) 取出結果
            for p in jsonObj {
                print("姓名: \(p["姓名"] as! String)")
                print("年齡: \(p["年齡"] as! Int)")
                
                if let tels = p["電話"] {
                    print ("公司電話: \(tels["公司"] as! String)")
                    print ("住家電話: \(tels["住家"] as! String)")
                }
                
                print("----------------")
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

