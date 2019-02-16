//
//  ViewController.swift
//  Beacon
//
//  Created by ChuKoKang on 2016/8/8.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let lm = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lm.requestAlwaysAuthorization()
        lm.delegate = self
        
        let uuid = UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
        let region = CLBeaconRegion(proximityUUID: uuid!, identifier: "myregion")
        
        // 用來得知附近 beacon 的資訊。觸發1號method
        lm.startRangingBeacons(in: region)
        // 用來接收進入區域或離開區域的通知。觸發2號與3號method
        lm.startMonitoring(for: region)
    }
    
    /* 1號method */
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        for beacon in beacons {
            print("major=\(beacon.major) minor=\(beacon.minor) accury=\(beacon.accuracy) rssi=\(beacon.rssi)")
                switch beacon.proximity {
                case .far:
                    print("beacon距離遠")
                
                case .near:
                    print("beacon距離近")

                case .immediate:
                    print("beacon就在旁邊")
                
                case .unknown:
                    print("beacon距離未知")
            }
        }
    }
    
    /* 2號method */
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        // 進入區域
        print("Enter \(region.identifier)")
    }

    /* 3號method */
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        // 離開區域
        print("Exit \(region.identifier)")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

