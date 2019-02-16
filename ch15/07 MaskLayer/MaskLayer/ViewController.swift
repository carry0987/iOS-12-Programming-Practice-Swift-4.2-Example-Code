//
//  ViewController.swift
//  MaskLayer
//
//  Created by KoKang Chu on 2017/6/13.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let maskLayer = CALayer()
    maskLayer.frame = imageView.bounds
    maskLayer.contentsGravity = kCAGravityResizeAspect
    maskLayer.contents = UIImage(named: "mask.png")?.cgImage
    
    imageView.layer.mask = maskLayer
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

