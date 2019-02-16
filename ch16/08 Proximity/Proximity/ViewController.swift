//
//  ViewController.swift
//  Proximity
//
//  Created by ChuKoKang on 2016/7/23.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @objc func proximityStateChanged(_ sender: NSNotification) {
        let device = UIDevice.current
        if device.proximityState {
            print("物體接近")
        } else {
            print("物體遠離")
        }
    }
    
    func turnOffProximity() {
        UIDevice.current.isProximityMonitoringEnabled = false
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name.UIDeviceProximityStateDidChange,
            object: nil
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let device = UIDevice.current
        device.isProximityMonitoringEnabled = true
        
        if device.isProximityMonitoringEnabled {
            let nc = NotificationCenter.default
            nc.addObserver(
                self,
                selector: #selector(proximityStateChanged(_:)),
                name: NSNotification.Name.UIDeviceProximityStateDidChange,
                object: nil
            )
        } else {
            print("此裝置沒有接近感應器")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

