//
//  ViewController.swift
//  TraitInfo
//
//  Created by ChuKoKang on 2016/8/16.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        switch traitCollection.userInterfaceIdiom {
        case .pad:
            print("此裝置為 iPad")
            
        case .phone:
            print("此裝置為 iPhone")
            
        case .tv:
            print("此裝置為 Apple TV")
            
        case .carPlay:
            print("此裝置為車用裝置")
            
        case .unspecified:
            print("無法判別")
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        if newCollection.horizontalSizeClass == .compact {
            print("Compact Width")
        }
            
        else if (newCollection.horizontalSizeClass == .regular) {
            print("Regular Width")
        }
        
        if newCollection.verticalSizeClass == .compact {
            print("Compact Height")
        }
            
        else if (newCollection.verticalSizeClass == .regular) {
            print("Regular Height")
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        switch UIDevice.current.orientation {
        case .faceDown:
            print("裝置面朝下")
            
        case .faceUp:
            print("裝置面朝上")
            
        case .landscapeLeft:
            print("裝置橫向，HOME在右邊")
            
        case .landscapeRight:
            print("裝置橫向，HOME在左邊")
            
        case .portrait:
            print("裝置直向")
            
        case .portraitUpsideDown:
            print("裝置上下顛倒")
            
        case .unknown:
            print("無法判定")
        }
        
        print("解析度為 \(size.width) x \(size.height)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

