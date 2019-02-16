//
//  ViewController.swift
//  Collision
//
//  Created by ChuKoKang on 2016/7/8.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dynItem: UIView!
    
    var ani: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ani = UIDynamicAnimator(referenceView: view)
        
        // 引力
        let gravity = UIGravityBehavior(items: [dynItem])
        // 碰撞
        let collision = UICollisionBehavior(items: [dynItem])
        // 遇邊界停止
        collision.translatesReferenceBoundsIntoBoundary = true
        
        ani.addBehavior(gravity)
        ani.addBehavior(collision)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

