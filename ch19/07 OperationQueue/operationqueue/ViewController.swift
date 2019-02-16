//
//  ViewController.swift
//  OperationQueue
//
//  Created by ChuKoKang on 2016/7/6.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let q = OperationQueue()
        q.addOperation {
            // 執行緒 1
            for i in 1 ... 5 {
                print(i)
            }
        }
        
        q.addOperation { 
            // 執行緒 2
            for i in 6 ... 10 {
                print(i)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

