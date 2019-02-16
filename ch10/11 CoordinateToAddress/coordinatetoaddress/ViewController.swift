//
//  ViewController.swift
//  CoordinateToAddress
//
//  Created by ChuKoKang on 2016/7/28.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 這個位置是台北故宮的座標
        let location = CLLocation(latitude: 25.102645, longitude: 121.548506)
        let geocoder = CLGeocoder()
        
        // 將座標轉換成地址
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard error == nil else {
                return
            }
            
            guard placemarks != nil else {
                return
            }
            
            for placemark in placemarks! {
                let addressDict = placemark.addressDictionary
                
                for key in (addressDict?.keys)! {
                    let value = addressDict?[key]
                    
                    // 有時候 value 是 NSArray 型態
                    if value is NSArray {
                        for p in value as! NSArray {
                            print("=>\(key): \(p)")
                        }
                    }
                    
                    // 有時候 value 是 String 型態
                    if value is String {
                        print("\(key): \(value!)")
                        
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

