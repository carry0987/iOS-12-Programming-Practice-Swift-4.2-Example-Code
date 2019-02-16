//
//  ViewController.swift
//  BorrowTime
//
//  Created by KoKang Chu on 2017/7/19.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.global().async {
            while (true) {
                let t = UIApplication.shared.backgroundTimeRemaining
                print("還剩下\(t)秒")
                sleep(1)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

