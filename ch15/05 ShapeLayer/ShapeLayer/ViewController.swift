//
//  ViewController.swift
//  ShapeLayer
//
//  Created by KoKang Chu on 2017/6/12.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 直角正方形
        let path1 = UIBezierPath(rect: CGRect(x: 50, y: 50, width: 100, height: 100))
        // 圓角矩形
        let path2 = UIBezierPath(roundedRect: CGRect(x: 50, y: 200, width: 130, height: 80), cornerRadius: 10.0)
        path1.append(path2)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.path = path1.cgPath
        
        view.layer.addSublayer(shapeLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

