//
//  ViewController.swift
//  BatteryInfo
//
//  Created by ChuKoKang on 2016/7/24.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        
        // 取得目前電力, 如果得到 -1.0，代表未開啓電池狀態監視
        print("電力: \(device.batteryLevel)")

        // 取得電池狀態
        switch device.batteryState {
        case .charging:
            print("充電中")
            
        case .full:
            print("電力全滿")
            
        case .unplugged:
            print("未充電")
            
        case .unknown:
            print("未知")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

