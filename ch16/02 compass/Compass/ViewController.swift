//
//  ViewController.swift
//  Compass
//
//  Created by ChuKoKang on 2016/7/21.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let lm = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lm.delegate = self
        lm.startUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if newHeading.headingAccuracy < 0 {
            print("請進行校正並遠離磁性干擾源")
        } else {
            print("目前面向 \(newHeading.magneticHeading)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

