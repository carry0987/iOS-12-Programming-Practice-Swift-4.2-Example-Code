//
//  ViewController.swift
//  GradientLayer
//
//  Created by KoKang Chu on 2017/6/12.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.cyan.cgColor]
        gradientLayer.locations = [0.1, 0.3]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.addSublayer(gradientLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

