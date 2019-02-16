//
//  ViewController.swift
//  Attachement
//
//  Created by ChuKoKang on 2016/7/8.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var anchor: UILabel!
    @IBOutlet weak var dynItem: UIView!
    
    var ani: UIDynamicAnimator!
    
    @IBAction func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        // 取得手指的座標
        let point = sender.location(in: view)
        
        // 移動 anchor 物件
        anchor.center = point
        
        // 透過 ani 變數取得附著這個動態行為
        let be = ani.behaviors.first as! UIAttachmentBehavior
        
        // 移動大的View元件（即 dynItem）到新座標
        be.anchorPoint = point

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ani = UIDynamicAnimator(referenceView: view)
        let be = UIAttachmentBehavior(
            item: dynItem,
            offsetFromCenter: UIOffsetMake(25, 25),
            attachedToAnchor: anchor.center
        )
        
        ani.addBehavior(be)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

