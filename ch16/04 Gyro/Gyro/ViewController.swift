//
//  ViewController.swift
//  Gyro
//
//  Created by ChuKoKang on 2016/7/23.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let mm = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mm.startGyroUpdates(to: OperationQueue()) { (data, error) in
            if let data = data {
                let tmp = data.rotationRate
                print("(x, y, z) = (\(tmp.x), \(tmp.y), \(tmp.z))")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

