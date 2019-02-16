//
//  ViewController.swift
//  ImageFilter
//
//  Created by ChuKoKang on 2016/7/28.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let origin = CIImage(image: UIImage(named: "a.jpg")!)
        
        // 將圖片套用單色濾鏡
        let filter = CIFilter(name: "CIPhotoEffectMono")
        filter?.setDefaults()
        filter?.setValue(origin, forKey: kCIInputImageKey)

        // 取得套用濾鏡後的效果
        if let output = filter?.outputImage {
            // 將照片轉為 UIImage 格式
            let tmp = CIContext().createCGImage(output, from: output.extent)
            
            // 顯示套用濾鏡後的結果
            imageView.image = UIImage(cgImage: tmp!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

