//
//  ViewController.swift
//  Folder
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
        // 建立目錄
        src = path + "/dir1"
        
        do {
            try fm.createDirectory(atPath: src, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("建立 dir1 目錄失敗")
        }
        
        ////////////////////////
        // 複製目錄
        src = path + "/dir1"
        dst = path + "/dir2"
        
        do {
            try fm.copyItem(atPath: src, toPath: dst)
        } catch {
            print("複製目錄失敗")
        }
        
        ////////////////////////
        // 移動目錄或更改名稱
        src = path + "/dir2"
        dst = path + "/dir3"
        
        do {
            try fm.moveItem(atPath: src, toPath: dst)
        } catch {
            print("移動目錄失敗")
        }
        
        ////////////////////////
        // 刪除目錄
        dst = path + "/dir3"
        do {
            try fm.removeItem(atPath: dst)
        } catch {
            print("刪除目錄失敗")
        }
        
        ////////////////////////
        // 檢查目錄是否存在
        dst = path + "/dir3"
        if fm.fileExists(atPath: dst) {
            print("目錄存在")
        } else {
            print("目錄不存在")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

