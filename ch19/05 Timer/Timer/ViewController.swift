//
//  ViewController.swift
//  Timer
//
//  Created by ChuKoKang on 2016/7/6.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.ticker()
        }
    }

    func ticker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        let whatTime = formatter.string(from: Date())
        
        print(whatTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

