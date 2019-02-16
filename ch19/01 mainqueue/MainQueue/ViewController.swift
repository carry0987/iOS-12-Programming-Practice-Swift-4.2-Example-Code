//
//  ViewController.swift
//  MainQueue
//
//  Created by ChuKoKang on 2016/7/2.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let q = DispatchQueue.main
        q.async { 
            // 程式區段1
            for i in 1 ... 10 {
                print(i)
            }
        }

        q.async { 
            // 程式區段2
            for i in 11 ... 20 {
                print(i)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

