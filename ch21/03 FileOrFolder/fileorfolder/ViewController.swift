//
//  ViewController.swift
//  FileOrFolder
//
//  Created by ChuKoKang on 2016/7/18.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSHomeDirectory()
        let fm = FileManager.default
        var isDir: ObjCBool = true
        
        fm.fileExists(atPath: path, isDirectory: &isDir)
        if isDir.boolValue {
            print("此為目錄")
        } else {
            print("此為檔案")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

