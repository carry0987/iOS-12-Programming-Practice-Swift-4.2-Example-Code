//
//  ViewController.swift
//  Navigator
//
//  Created by ChuKoKang on 2016/7/9.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 設定座標
        let taipei101 = CLLocationCoordinate2D(latitude: 25.033850, longitude: 121.564977)
        let airstation = CLLocationCoordinate2D(latitude: 25.068554, longitude: 121.552932)
        
        // 根據座標得到地標
        let pA = MKPlacemark(coordinate: taipei101, addressDictionary: nil)
        let pB = MKPlacemark(coordinate: airstation, addressDictionary: nil)
        
        // 根據地標建立地圖項目
        let miA = MKMapItem(placemark: pA)
        let miB = MKMapItem(placemark: pB)
        miA.name = "台北101"
        miB.name = "松山機場"
        
        // 將起迄點放到陣列中
        let routes = [miA, miB]
        
        // 設定為開車模式
        let options = [MKLaunchOptionsDirectionsModeKey:
            MKLaunchOptionsDirectionsModeDriving]
        
        // 開啟地圖開始導航
        MKMapItem.openMaps(with: routes, launchOptions: options)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

