//
//  ViewController.swift
//  Pin
//
//  Created by ChuKoKang on 2016/7/9.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2D(latitude: 24.137426, longitude: 121.275753)
        ann.title = "武嶺"
        ann.subtitle = "南投縣仁愛鄉"
        mapView.addAnnotation(ann)

        // 移動地圖
        mapView.setCenter(ann.coordinate, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

