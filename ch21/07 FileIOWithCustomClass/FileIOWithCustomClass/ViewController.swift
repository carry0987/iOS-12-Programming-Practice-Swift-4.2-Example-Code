//
//  ViewController.swift
//  FileIOWithCustomClass
//
//  Created by ChuKoKang on 2016/7/19.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "a.jpg")
        
        // 初始化 MyObj
        let myObj = MyObj(image: image!, text: "此圖片說明")
        
        // 存檔，檔名為 save.dat
        let filename = NSHomeDirectory() + "/Documents/save.data"
        if NSKeyedArchiver.archiveRootObject(myObj, toFile: filename) == false {
            print("存檔失敗")
        }
        
        // 讀檔
        if let tmp = NSKeyedUnarchiver.unarchiveObject(withFile: filename) as? MyObj {
            // 請在 storyboard 上自行拖放Label與Image View元件
            imageView.image = tmp.image
            label.text = tmp.text
        } else {
            print("讀檔失敗")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

