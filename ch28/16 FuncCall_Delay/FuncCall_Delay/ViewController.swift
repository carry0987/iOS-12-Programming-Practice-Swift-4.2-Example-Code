//
//  ViewController.swift
//  FuncCall_Delay
//
//  Created by ChuKoKang on 2016/7/28.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @objc func myFunc(_ sender: Any?) {
        if sender is String {
            print(sender!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        perform(#selector(myFunc(_:)), with: "hello", afterDelay: 2.0)
        // 以下如果還有程式碼的話會立即執行
        print("執行")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

