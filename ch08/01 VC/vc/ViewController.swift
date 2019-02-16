//
//  ViewController.swift
//  VC
//
//  Created by KoKang Chu on 2017/6/9.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myView: UIView!
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    // 顯示 myView
    @IBAction func showMyView(_ sender: Any) {
        blurEffect.frame = view.frame
        view.addSubview(blurEffect)
        
        myView.center = view.center
        myView.layer.cornerRadius = 10
        view.addSubview(myView)
    }
    
    // 關閉 myView
    @IBAction func closeMyView(_ sender: Any) {
        blurEffect.removeFromSuperview()
        myView.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

