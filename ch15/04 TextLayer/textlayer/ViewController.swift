//
//  ViewController.swift
//  TextLayer
//
//  Created by KoKang Chu on 2017/6/12.
//  Copyright © 2017年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let textlayer = CATextLayer()
        // 圖層上顯示的文字
        textlayer.string = "Image Demo"
        // 設定字型、大小與顏色
        let font = UIFont(name: "Zapfino", size: 19)
        textlayer.font = font
        textlayer.fontSize = font?.pointSize ?? 17
        textlayer.foregroundColor = UIColor.black.cgColor
        
        // 設定圖層位置與大小。目前設定 imageView 的左上角。
        textlayer.frame = CGRect(x: 20, y: 20, width: 150, height: 70)
        
        // 設定圖層解析度跟目前裝置解析度一致
        // 這一行沒加，在retina螢幕上文字是模糊的
        textlayer.contentsScale = UIScreen.main.scale
        
        // 將圖層加到 imageView 元件上
        imageView.layer.addSublayer(textlayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

