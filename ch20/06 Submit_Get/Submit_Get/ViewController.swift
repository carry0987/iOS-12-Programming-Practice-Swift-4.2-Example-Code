//
//  ViewController.swift
//  Submit_Get
//
//  Created by ChuKoKang on 2016/7/18.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "http://my.web/add.php?x=10&y=20")
        do {
            // 取得送出資料後的傳回值
            let html = try String(contentsOf: url!)
            print(html)
        } catch {
            print(error)
        }        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

