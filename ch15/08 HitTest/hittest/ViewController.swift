//
//  ViewController.swift
//  Test
//
//  Created by KoKang Chu on 2017/6/13.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CALayerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let greenLayer = CALayer()
        greenLayer.name = "green"
        greenLayer.frame = CGRect(x: 50, y: 50, width: 150, height: 150)
        greenLayer.backgroundColor = UIColor.green.cgColor
        
        let purpleLayer = CALayer()
        purpleLayer.name = "purple"
        purpleLayer.frame = CGRect(x: 160, y: 160, width: 80, height: 120)
        purpleLayer.backgroundColor = UIColor.purple.cgColor
        
        view.layer.addSublayer(greenLayer)
        view.layer.addSublayer(purpleLayer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 取得使用者手指點到螢幕時的手指座標
        guard let point = touches.first?.location(in: view) else {
            return
        }
        
        // 測試該座標是否在某個 layer 範圍內，如果是，則傳回該 layer
        guard let layer = view.layer.hitTest(point) else {
            return
        }
        
        // 取得該 layer 的名字
        guard let layerName = layer.name else {
            return
        }
        
        // 找出目前所有子圖層中 zPosition 的最大值
        // 然後將目前點選到的圖層的 zPosition 設定為（最大值 + 1)
        // 已設定目前點選到的圖層會在最上層
        let sublayers = view.layer.sublayers!
        layer.zPosition = sublayers.reduce(sublayers.first!, {
            ($0.zPosition > $1.zPosition) ? $0 : $1
        }).zPosition + 1
        
        switch layerName {
        case "green":
            print("green layer")
            
        case "purple":
            print("purple layer")
            
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


