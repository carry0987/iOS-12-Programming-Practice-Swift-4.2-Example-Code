//
//  ViewController.swift
//  File
//
//  Created by ChuKoKang on 2016/7/18.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var src, dst: String
        // 設定工作目錄
        let fm = FileManager.default
        let path = NSHomeDirectory() + "/Documents"
        
        ////////////////////////
        // 建立 a.txt 並寫入 hello
        src = path + "/a.txt"
        let data = "hello world".data(using: .utf8)
        if fm.createFile(atPath: src, contents: data, attributes: nil) {
            print("檔案建立成功")
        } else {
            print("檔案建立失敗")
        }
        
        ////////////////////////
        // 複製檔案
        src = path + "/a.txt"
        dst = path + "/b.txt"
        do {
            try fm.copyItem(atPath: src, toPath: dst)
        } catch {
            print("複製檔案失敗")
        }
        
        ////////////////////////
        // 移動檔案或更改名稱
        src = path + "/b.txt"
        dst = path + "/c.txt"
        do {
            try fm.moveItem(atPath: src, toPath: dst)
        } catch {
            print("移動檔案失敗")
        }
        
        ////////////////////////
        // 刪除 c.txt 檔案
        src = path + "/c.txt"
        do {
            try fm.removeItem(atPath: src)
        } catch {
            print("刪除檔案失敗")
        }
        
        ////////////////////////
        // 檢查檔案是否存在
        src = path + "/c.txt"
        if fm.fileExists(atPath: src) {
            print("檔案存在")
        } else {
            print("檔案不存在")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

