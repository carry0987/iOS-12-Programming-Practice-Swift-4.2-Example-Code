//
//  ViewController.swift
//  RotationGesture
//
//  Created by ChuKoKang on 2016/7/2.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        let rad = Float(sender.rotation)
        let deg = rad * 180 / Float(Double.pi)
        
        if deg >= 0 {
            print("順時針旋轉")
        } else {
            print("逆時針旋轉")
        }
        
        print("弧度:\(rad) 角度:\(deg)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

