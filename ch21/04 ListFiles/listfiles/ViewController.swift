//
//  ViewController.swift
//  ListFiles
//
//  Created by ChuKoKang on 2016/7/19.
//  Copyright © 2016年 ChuKoKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fm = FileManager.default
        
        do {
            let files = try fm.contentsOfDirectory(atPath: NSHomeDirectory())
            for file in files {
                print(file)
            }
        } catch {
            print("error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

