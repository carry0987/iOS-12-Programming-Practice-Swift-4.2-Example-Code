//
//  ViewController.swift
//  AnimatedCircle
//
//  Created by KoKang Chu on 2017/6/12.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layer = drawCircle()
        layer.add(strokeEndAnimation(), forKey: nil)
        view.layer.addSublayer(layer)
    }
    
    func strokeEndAnimation() -> CABasicAnimation {
        let ani = CABasicAnimation(keyPath: "strokeEnd")
        ani.duration = 1        // 動畫時間 1 秒
        ani.fromValue = 0.0     // 落筆開始位置
        ani.toValue = 0.7       // 動畫到 70% 就停止
        ani.isRemovedOnCompletion = false   // 動畫結束後是否要移除動畫效果
        ani.fillMode = kCAFillModeForwards
        ani.repeatCount = 0     // 動畫重複次數
        
        return ani
    }
    
    func drawCircle() -> CAShapeLayer {
        let path = UIBezierPath(
            arcCenter: CGPoint(x: 150, y: 300),
            radius: 70,
            startAngle: 0,
            endAngle: 2 * CGFloat.pi,
            clockwise: true
        )
        
        let sharpLayer = CAShapeLayer()
        sharpLayer.strokeColor = UIColor.red.cgColor
        sharpLayer.lineWidth = 8
        sharpLayer.fillColor = UIColor.clear.cgColor
        sharpLayer.path = path.cgPath
        
        return sharpLayer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

