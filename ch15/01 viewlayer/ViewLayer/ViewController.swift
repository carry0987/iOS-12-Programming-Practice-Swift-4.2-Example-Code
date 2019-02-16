//
//  ViewController.swift
//  ViewLayer
//
//  Created by KoKang Chu on 2017/6/13.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 邊框
        border(in: myView.layer)
        
        // 陰影
        shadow(in: myView.layer)
        
        // 圓角
        cornerRadius(in: myView.layer)
        
        // 旋轉
//        myView.layer.setAffineTransform(rotate())
        
        // 放大縮小
//        myView.layer.setAffineTransform(scale())
        
        // 同時旋轉與放大縮小
        myView.layer.setAffineTransform(rotate().concatenating(scale()))
    }
    
    // 設定邊框
    func border(in layer: CALayer) {
        // 邊框顏色
        layer.borderColor = UIColor.black.cgColor
        // 邊框寬度
        layer.borderWidth = 2
    }
    
    // 設定陰影
    func shadow(in layer: CALayer) {
        // 陰影顏色為灰色
        layer.shadowColor = UIColor.gray.cgColor
        
        // 陰影向圖層右下角偏移5點;
        layer.shadowOffset = CGSize(width: 5, height: 5)
        // 設定透明度
        layer.shadowOpacity = 0.8
        // 設定圓角
        layer.shadowRadius = 10.0
    }
    
    // 設定圓角
    func cornerRadius(in layer: CALayer) {
        layer.cornerRadius = 10
    }
    
    // 旋轉
    func rotate() -> CGAffineTransform {
        // 旋轉 45 度
        return CGAffineTransform(rotationAngle: 45 / 180 * CGFloat.pi)
    }
    
    // 放大縮小
    func scale() -> CGAffineTransform {
        // 長寬各乘上0.5倍
        return CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

