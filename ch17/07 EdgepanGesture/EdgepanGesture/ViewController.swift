//
//  ViewController.swift
//  EdgepanGesture
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

    @IBAction func handleEdgepanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        let point = sender.location(in: sender.view)
        print("手指的座標為 (\(point.x), \(point.y))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

