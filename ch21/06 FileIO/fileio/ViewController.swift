//
//  ViewController.swift
//  FileIO
//
//  Created by ChuKoKang on 2016/7/19.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 文字格式檔案存取
        // 設定a.txt檔案路徑
        var filename = NSHomeDirectory() + "/Documents/a.txt"
        
        do {
            // 將字串 hello 寫入檔案
            try "hello".write(toFile: filename, atomically: true, encoding: .utf8)
        } catch {
            print("文字存檔失敗")
        }
        
        do {
            let string = try String(contentsOfFile: filename, encoding: .utf8)
            print(string)   // 印出 hello
        } catch {
            print("文字讀檔失敗")
        }
        
        // 二進位格式檔案存取 - 以圖片為例
        var image = UIImage(named: "a.jpg")
        // 設定圖片的存檔檔名
        filename = NSHomeDirectory() + "/Documents/image.dat"
        let url = URL(fileURLWithPath: filename)
        
        // 存檔
        let data = UIImagePNGRepresentation(image!)
        do {
            try data?.write(to: url)
        } catch {
            print("圖片存檔失敗")
        }
        
        // 從檔案讀出圖片
        if let data = try? Data(contentsOf: url) {
            image = UIImage(data: data)
        } else {
            print("圖片讀檔失敗")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

