//
//  ViewController.swift
//  AddressToCoordinate
//
//  Created by ChuKoKang on 2016/7/28.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!

    @IBAction func onClick(_ sender: AnyObject) {
        let request = MKLocalSearchRequest()
        // 可輸入地址或是關鍵字
        request.naturalLanguageQuery = "郵局"
        // 這一行必須等地圖出現後才能得到正確的region資料
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start { (response, error) in
            guard error == nil else {
                return
            }
            
            guard response != nil else {
                return
            }

            for item in (response?.mapItems)! {
                self.mapView.addAnnotation(item.placemark)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

