//
//  ViewController.swift
//  GPS
//
//  Created by ChuKoKang on 2016/7/20.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let lm = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lm.requestAlwaysAuthorization()
        
        lm.delegate = self
        lm.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("緯度: \(location.coordinate.longitude)")
            print("經度: \(location.coordinate.longitude)")
            print("高度: \(location.altitude)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

