//
//  ViewController.swift
//  Map3D
//
//  Created by ChuKoKang on 2016/7/28.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ground 為巴黎鐵塔的座標
        let ground = CLLocationCoordinate2DMake(48.858356, 2.294481)
        
        // eyeFrom 為攝影機的座標
        let eyeFrom = CLLocationCoordinate2DMake(48.847, 2.294481)
        
        // 設定攝影機位置與高度
        let camera = MKMapCamera(lookingAtCenter: ground, fromEyeCoordinate: eyeFrom, eyeAltitude: 50)
        
        // 設定以3D衛星圖方式呈現
        mapView.mapType = .satelliteFlyover
        
        // 允許可以從斜的方向觀看地圖，否則都是從正上方
        mapView.isPitchEnabled = true
        
        // 在地圖上加上攝影機
        mapView.camera = camera
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

