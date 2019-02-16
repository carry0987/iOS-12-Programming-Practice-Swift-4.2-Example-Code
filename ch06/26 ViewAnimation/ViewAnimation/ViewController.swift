//
//  ViewController.swift
//  ViewAnimation
//
//  Created by KoKang Chu on 2017/6/27.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 設定 label 透明
        label.alpha = 0
        // 準備將 label 往下移 300 點
        var frame = self.label.frame
        frame.origin.y += 300
        
        UIView.animate(withDuration: 2.0) {
            // 設定 label 不透明，並且移到新座標
            self.label.alpha = 1
            self.label.frame = frame
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

