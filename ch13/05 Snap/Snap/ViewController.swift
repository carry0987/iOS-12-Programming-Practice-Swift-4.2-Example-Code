//
//  ViewController.swift
//  Snap
//
//  Created by ChuKoKang on 2016/7/8.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dynItem: UIView!
    
    var ani: UIDynamicAnimator!
    
    @IBAction func handleTapGesture(_ sender: Any) {
        let point = sender.location(in: view)
        
        let snap = UISnapBehavior(item: dynItem, snapTo: point)
        
        // damping是阻尼，控制物體衝向新座標後的擺盪量
        // 值的範圍為0.0~1.0。0.0擺盪最大，1.0擺盪最小
        // 預設值為0.5
        snap.damping = 0.5;
        
        // snap 效果結束後就失效，因此每一次使用 snap 前
        // 都必須先把之前的 snap 清除掉
        
        ani.removeAllBehaviors()
        ani.addBehavior(snap)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ani = UIDynamicAnimator(referenceView: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

