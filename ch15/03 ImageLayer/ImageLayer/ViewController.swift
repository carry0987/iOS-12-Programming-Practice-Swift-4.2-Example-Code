//
//  ViewController.swift
//  ImageLayer
//
//  Created by KoKang Chu on 2017/6/13.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layer = CALayer()
        layer.frame = CGRect(x: 50, y: 100, width: 200, height: 300)
        layer.contents = UIImage(named: "IMG_9102.jpg")?.cgImage
        
        // 相當於 Image View 元件設定 Aspect Fill
        layer.contentsGravity = kCAGravityResizeAspectFill
        // 相當於 Image View 元件設定「Clip To Bounds」
        layer.masksToBounds = true
        
        view.layer.addSublayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

