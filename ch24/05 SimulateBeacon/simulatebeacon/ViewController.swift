//
//  ViewController.swift
//  SimulateBeacon
//
//  Created by ChuKoKang on 2016/8/9.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    var peripheralManager: CBPeripheralManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let queue = DispatchQueue.global()
        peripheralManager = CBPeripheralManager(delegate: self, queue: queue)
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        guard peripheral.state == .poweredOn else {
            print("藍牙未開啟")
            return
        }
        
        peripheral.delegate = self
        
        // uuid可在終端機由uuidgen指令產生
        let uuid = UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
        // 雖然identifier參數在這裡沒有用處，但不可以填nil
        let region = CLBeaconRegion(
            proximityUUID: uuid!,
            major: 2000,
            minor: 56,
            identifier: ""
        )
        
        var advData = [String: Any]()
        for (key, value) in region.peripheralData(withMeasuredPower: nil) {
            advData[key as! String] = value
        }
        
        // mybeacon是當某裝置進行掃描周圍藍牙裝置時會看到的名字
        advData[CBAdvertisementDataLocalNameKey] = "mybeacon"
        // 開始廣播訊號
        peripheral.startAdvertising(advData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

