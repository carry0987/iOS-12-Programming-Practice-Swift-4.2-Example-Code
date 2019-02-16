//
//  ViewController.swift
//  Accelerometer
//
//  Created by ChuKoKang on 2016/7/21.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let mm = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mm.startAccelerometerUpdates(to: OperationQueue()) { (data, error) in
            if let data = data {
                let tmp = data.acceleration
                print("(x, y, z) = (\(tmp.x), \(tmp.y), \(tmp.z))")
            }

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

