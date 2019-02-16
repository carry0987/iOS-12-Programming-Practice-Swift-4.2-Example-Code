//
//  ViewController.swift
//  LongpressGesture
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

    @IBAction func handleLongpressGusture(_ sender: UILongPressGestureRecognizer) {
        for i in 0 ..< sender.numberOfTouches {
            let point = sender.location(ofTouch: i, in: sender.view)
            print("第 \(i) 根手指的座標為 (\(point.x), \(point.y))")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

