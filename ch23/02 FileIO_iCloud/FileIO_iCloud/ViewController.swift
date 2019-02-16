//
//  ViewController.swift
//  FileIO_iCloud
//
//  Created by ChuKoKang on 2016/8/1.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fileURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fm = FileManager.default
        
        guard fm.ubiquityIdentityToken != nil else {
            print("請開啟 iCloud Drive")
            return
        }
        
        fileURL = fm.url(forUbiquityContainerIdentifier: nil)
        if fileURL != nil {
            fileURL = fileURL?.appendingPathComponent("a.txt")
        }
    }

    // 存檔
    @IBAction func saveButton(_ sender: Any) {
        guard fileURL != nil else {
            return
        }
        
        do {
            try "嗨您好".write(to: fileURL!, atomically: true, encoding: .utf8)
        } catch {
            print(error)
        }
    }

    // 開檔
    @IBAction func openButton(_ sender: Any) {
        guard fileURL != nil else {
            return
        }

        do {
            let str = try String(contentsOf: fileURL!, encoding: .utf8)
            print(str)
        } catch {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

