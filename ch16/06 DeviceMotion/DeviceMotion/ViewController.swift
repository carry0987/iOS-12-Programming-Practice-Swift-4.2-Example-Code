//
//  ViewController.swift
//  DeviceMotion
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
        
        mm.startDeviceMotionUpdates(to: OperationQueue()) { (motion, error) in
            if let motion = motion {
                // 裝置目前的姿勢
                let attitude = motion.attitude
                print("\(attitude.pitch), \(attitude.roll), \(attitude.yaw)")
                
                // 三軸的轉動弧度
                let rotation = motion.rotationRate
                print("\(rotation.x), \(rotation.y), \(rotation.z)")
                
                // 三軸方向的重力加速度
                let gravity = motion.gravity
                print("\(gravity.x), \(gravity.y), \(gravity.z)")
                
                // 三軸方向的加速度，不包含重力加速度
                let acceleration = motion.userAcceleration
                print("\(acceleration.x), \(acceleration.y), \(acceleration.z)")
                
                // 三軸方向的磁場強度
                let magnetic = motion.magneticField
                print("\(magnetic.field.x), \(magnetic.field.y), \(magnetic.field.z)")
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

