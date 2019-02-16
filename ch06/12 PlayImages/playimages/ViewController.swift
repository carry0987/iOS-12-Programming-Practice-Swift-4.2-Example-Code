//
//  ViewController.swift
//  PlayImages
//
//  Created by KoKang Chu on 2017/6/27.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var images = [UIImage]()
    
    // 載入所有要播放的圖片
    for i in 1...5 {
        let name = String(format: "%02d", i)
        images.append(UIImage(named: name)!)
    }
    
    imageView.animationImages = images
    // 設定10秒內播完
    imageView.animationDuration = 10
    // 設定重複2次
    imageView.animationRepeatCount = 2
    
    // 開始播放
    imageView.startAnimating()
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

